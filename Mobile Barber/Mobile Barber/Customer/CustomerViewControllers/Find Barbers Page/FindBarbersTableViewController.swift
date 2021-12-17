
import UIKit

class FindBarbersTableViewController: UITableViewController {

    var barbers: [Barber] = []
    
    let findBarbersController = FindBarbersController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // comment these following code to switch to practical field, this is only for testing
        // these following code load data from disk and save data to disk
        if let barbers = Barber.loadBarbersFromDisk() {
            self.barbers = barbers
        } else {
            self.barbers = Barber.loadSampleBarberShop()
        }
        updataUI()
//        navigationItem.title = "Find new Barber shops"
        
        // used for generating sample json data
//        let encoder = JSONEncoder()
//        let data = try? encoder.encode(barbers)
//        print(String(data: data!, encoding: .utf8)!)
        
        // uncomment these following code to fetch data from internet, which is tested successfully,
        // but remember to check url in file AppoinmentsController.swift
         /*
        findBarbersController.fetchFindBarbers { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let barbers):
                    let count = barbers.count
                    for index in 0..<count {
                        self.barbers.append(barbers[index])
                        let indexPath = IndexPath(row: index, section: 0)
                        self.tableView.insertRows(at: [indexPath], with: .automatic)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
          */
         
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return barbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindBarberCellID", for: indexPath) as! FindBarberTableViewCell
        
        let barber = barbers[indexPath.row]
        cell.shopNameLabel.text = barber.shopName
        cell.photoProfileImage.image = UIImage(named: barber.photoProfile) ?? UIImage(systemName: "global")
        cell.ratePointsLabel.text = "Rate: \(barber.ratePoints)"
        cell.locationDescriptionLabel.text = "Location: " + barber.loacationDescription
        cell.serviceTypeLabel.text = "Service for: " + barber.serviceForGender
        cell.fisrtSampleServiceLabel.text = "Top 1: " + barber.servicesTypes[0]
        cell.secondSampleServiceLabel.text = "Top 2: " + barber.servicesTypes[1]

        return cell
    }
    

 
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
  
    @IBSegueAction func toFindBarberDetailView(_ coder: NSCoder, sender: Any?) -> FindBarberDetailViewController? {
        
        guard  let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell)
        else {
            return nil
        }
        
        let detailVC = FindBarberDetailViewController(coder: coder)
        detailVC?.barber = barbers[indexPath.row]
        return detailVC
    }
    
    @IBAction func unwindToFindBarberListView(segue: UIStoryboardSegue) {
        
    }
    
    func updataUI(){
        
    }
    
    /*
     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

}