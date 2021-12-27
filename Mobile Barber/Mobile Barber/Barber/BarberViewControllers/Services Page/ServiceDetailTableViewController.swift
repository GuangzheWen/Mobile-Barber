import UIKit

class ServiceDetailTableViewController: UITableViewController {

    @IBOutlet weak var serviceNameTextField: UITextField!
    @IBOutlet weak var serviceDescriptionTextField: UITextField!
    
    var service: Service?
    @IBOutlet weak var saveDoneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let service = service {
            navigationItem.title = service.serviceName
            serviceNameTextField.text = service.serviceName
            serviceDescriptionTextField.text = service.serviceDescription
        } else {
            navigationItem.title = "New Service"
        }
        
        updateSaveButtonState()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func textFieldEditChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func textFieldChanged2(_ sender: UITextField) {
        updateSaveButtonState()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
         
        guard segue.identifier == "saveServiceAndUnwind" else {
            return
        }
        let name = serviceNameTextField.text!
        let description = serviceDescriptionTextField.text!
        
        service = Service(serviceName: name , serviceDescription: description)
        
    }
    
    func updateSaveButtonState() {
        let nameBool = serviceNameTextField.text ?? ""
        let description = serviceDescriptionTextField.text ?? ""
        let shouldEnableSaveButton = !nameBool.isEmpty && !description.isEmpty
        saveDoneButton.isEnabled = shouldEnableSaveButton
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
    }
 */

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
