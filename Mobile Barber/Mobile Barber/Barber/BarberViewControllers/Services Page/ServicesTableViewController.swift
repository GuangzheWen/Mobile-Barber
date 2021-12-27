import UIKit

class ServicesTableViewController: UITableViewController {

    var services: [Service] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let services = Service.loadServicesFromDisk(){
            self.services = services
        } else {
            self.services = Service.loadSampleServices()
        }
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .black

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
        return services.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            services.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            Service.saveServices(services: services)
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCellID", for: indexPath)

        let service = services[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = service.serviceName
        cell.detailTextLabel?.text = service.serviceDescription
//        cell.delegate = self
        return cell
    }
    

    @IBSegueAction func editOrNewService(_ coder: NSCoder, sender: Any?) -> UITableViewController? {
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
                  return nil
              }
        let detailVC = ServiceDetailTableViewController()
        detailVC.service = services[indexPath.row]
        return detailVC
    }
    @IBAction func unwindToServicesPage(segue: UIStoryboardSegue){
        guard segue.identifier == "saveServiceAndUnwind" else {
            return
        }
        let detailVC = segue.source as! ServiceDetailTableViewController
        if let service = detailVC.service {
            
            if let indexOfExistingService = tableView.indexPathForSelectedRow {
                services[indexOfExistingService.row] = service
                tableView.reloadRows(at: [indexOfExistingService], with: .automatic)
            } else {
                let newIndexPath = IndexPath(row: services.count, section: 0)
                services.append(service)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        Service.saveServices(services: services)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
