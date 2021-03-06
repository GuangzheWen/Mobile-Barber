import UIKit

class FavoriteBarbersTableViewController: UITableViewController {

    // used to store favorite barber list
    var barbers: [Barber] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let barbers = Barber.loadBarbersFromDisk() {
            self.barbers = barbers
        } else {
            self.barbers = Barber.loadSampleBarberShop()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteBarberCellID", for: indexPath) as! FavoriteBarberTableViewCell
        
        // Configure the cell...
        let barber = barbers[indexPath.row]
        updateUI(cell, barber)
        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    @IBSegueAction func toFavoriteBarberDetailView(_ coder: NSCoder, sender: Any?) -> FavoriteBarberDetailTableViewController? {
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell)
        else { return nil }
        let detailVC = FavoriteBarberDetailTableViewController(coder: coder)
        
        detailVC?.barber = barbers[indexPath.row]
        return detailVC
    }
    
    @IBAction func unwindToFavoriteBarberListView(segue: UIStoryboardSegue) {
        // back from any page
    }
    
    func updateUI(_ cell: FavoriteBarberTableViewCell, _ barber: Barber){
        cell.shopName.text = barber.shopName
        cell.photoProfileImage.image = UIImage(named: barber.photoProfile) ?? UIImage(systemName: "global")
        cell.ratePointLabel.text = "Rate: \(barber.ratePoints)"
        cell.locationDescriptionLabel.text = "Location: " + barber.loacationDescription
        cell.serviceForGenderLabel.text = "Service for: " + barber.serviceForGender
        cell.firstSampleServiceLabel.text = "Top 1: " + barber.servicesTypes[0]
        cell.secondSampleServiceLabel.text = "Top 2: " + barber.servicesTypes[1]
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
