import UIKit



// This class is used for the role of Controller, controlling the appointment table view
class AppointmentsTableViewController: UITableViewController {
    
    // this variable stores appointments list from web service, disk
    // also stores appointments to be saved in disk or upload to network
    var appointments: [Appointment] = []
    // this is a model controller, in charge of fetch appointment data from internet
    let appointmentsController = AppointmentsController()
  
    
    
    // MARK: - views managements
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // comment these following code to switch to practical field, this is only for testing
        // these following code load data from disk and save data to disk
        if let appointments = Appointment.loadAppointmentsFromDisk() {
            self.appointments = appointments
        } else {
            self.appointments = Appointment.loadSampleAppointments()
        }
        
        // uncomment these following code to fetch data from internet, which is tested successfully,
        // but remember to check url in file AppoinmentsController.swift
        /*
        appointmentsController.fetchAppointments { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let appointments):
                    let count = appointments.count
                    for index in 0..<count {
                        self.appointments.append(appointments[index])
                        let indexPath = IndexPath(row: index, section: 0)
                        self.tableView.insertRows(at: [indexPath], with: .automatic)
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
        */
        
        
        // a considerable edit button which can automatically change to Done while editing
        navigationItem.leftBarButtonItem = editButtonItem

        navigationItem.leftBarButtonItem?.tintColor = .black
        
    }


    
    
    // MARK: - data source managements
    // return the number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // return the number of rows in certain section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentCellID", for: indexPath) as! AppointmentTableViewCell

        let appointment = appointments[indexPath.row]
        cell.titleLabel?.text = appointment.id + appointment.serviceType
        // Configure the cell...
        
        return cell
    }
    
    // return can edit row at, return true means all of rows can be edited
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            appointments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            Appointment.saveAppointments(appointments: appointments)
            // need to add push web service function here
        }
    }
    
    
    
    // MARK: - Navigation segues from scene to scene
    // feature for clicking cell and navigate to detailed view scene, mainly for data preparing
    @IBSegueAction func segueToDetailView(_ coder: NSCoder, sender: Any?) -> AppointmentDetailTableViewController? {
        
            
            guard let cell = sender as? UITableViewCell,
                  let indexPath = tableView.indexPath(for: cell)
            else {
                return nil
            }
            let detailVC = AppointmentDetailTableViewController(coder: coder)
            detailVC?.appointment = appointments[indexPath.row]
            
            return detailVC
    }
    
    @IBAction func unwindFromToAppointmentsList(segue: UIStoryboardSegue) {
        
    }
    
  /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
