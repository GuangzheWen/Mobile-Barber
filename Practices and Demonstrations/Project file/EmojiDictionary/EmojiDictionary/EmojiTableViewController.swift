//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Wayne on 2021/12/4.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if Emoji.loadFromFile().isEmpty {
            emojis = Emoji.sampleEmojis()
            Emoji.saveToFile(emojis: emojis)
        } else {
            emojis = Emoji.loadFromFile()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell

        let data = emojis[indexPath.row]
//        cell.textLabel?.text = "\(data.symbol) - \(data.name)"
//        cell.detailTextLabel?.text  = data.description
        cell.update(withEmoji: data)
        
        
//         Configure the cell...
        cell.showsReorderControl = true
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let emoji = emojis[indexPath.row]
//        print(emoji.symbol)
//
//    }
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
        sender.title = sender.title == "Edit" ? "Done" : "Edit"
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let emoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(emoji, at: destinationIndexPath.row)
        Emoji.saveToFile(emojis: emojis)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

     
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Emoji.saveToFile(emojis: emojis)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
     
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let emojiToEdit = emojis[indexPath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
          
        } else {
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
        
    }
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
              let sourceController = segue.source as? AddEditEmojiTableViewController,
              let emoji = sourceController.emoji
        else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
        Emoji.saveToFile(emojis: emojis) 
        
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    var emojis: [Emoji] = []
//    var emojis: [Emoji] = [
//       Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"), Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
//       Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
//       Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably uasdfasd asdf asdf asdf asdf asdf asdf asdf asdf asd asdgasdfgsing Xcode to write iOS apps in Swift).", usage: "apps, software, programming sdfgsdf gsdf sdf gsdfg sdfg sdf sdfh sdfh sdfhsdfh sdfhs dh dfshdf sdfh s"),
//       Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
//       Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
//       Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
//       Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
//       Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
//       Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
//       Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
//       Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
//    ]

}

