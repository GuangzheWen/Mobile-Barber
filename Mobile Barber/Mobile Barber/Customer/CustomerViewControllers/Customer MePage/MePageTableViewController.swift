
import UIKit

class MePageTableViewController: UITableViewController {
    var customer: Customer?
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    
//    var stateOfLoginAccount = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindToMePage(segue: UIStoryboardSegue) {
        switch segue.identifier {
        case "LoginButtonPressed":
            UserDefaults.standard.setValue(true, forKey: "isAccountSet")
            updateUI()
//            print(1)
        case "DoneButtonPressed":
            UserDefaults.standard.setValue(true, forKey: "isAccountSet")
            updateUI()
//            print(1)
        case "registerDoneID":
            updateUI()
            
        default:
            updateUI()
            return
        }
       
        
        
    }
    
    @IBSegueAction func toLoginPage(_ coder: NSCoder, sender: Any?) -> LoginPageViewController? {
        return LoginPageViewController(coder: coder)
    }
    
    
    func updateUI() {
        if !UserDefaults.standard.bool(forKey: "isAccountSet") {
            // false:
            print(UserDefaults.standard.bool(forKey: "isAccountSet"))
            nameLabel.text = "..."
            usernameLabel.text = "..."
            sexLabel.text = "..."
        } else {
            // ture:
            print(UserDefaults.standard.bool(forKey: "isAccountSet"))
            customer = Customer.loadCustomerFromDisk()
            if let customer = customer {
                nameLabel.text = customer.firstName + customer.lastName
                usernameLabel.text = customer.username
                sexLabel.text = customer.sex
                
            }
        }
    }
    
    
    @IBAction func switchToBarberModeButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Are you sure to switch to barber mode?", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let switchAction = UIAlertAction(title: "Switch", style: .default) { action in
            UserDefaults.standard.setValue(false, forKey: "isCustomer")
            UserDefaults.standard.setValue(true, forKey: "isBarber")
            
            exit(0)
//            DispatchQueue.main.asyncAfter(deadline: .now()) {
//                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
//                         }
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(switchAction)
        switchToBarberModeNotification()
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
        // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
