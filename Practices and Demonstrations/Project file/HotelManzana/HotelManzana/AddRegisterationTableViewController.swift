//
//  AddRegisterationTableViewController.swift
//  HotelManzana
//
//  Created by Wayne on 2021/12/7.
//

import UIKit

class AddRegisterationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    
    var registration: Registeration? {

        guard let roomType = roomType else { return nil }

        let firstName = fistNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailAddressTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numbersOfAdultsStepper.value)
        let numberOfChildren = Int(numbersOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn

        return Registeration(firstName: firstName, lastName: lastName, emailAdress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, wifi: hasWifi, roomType: roomType)
    }
    
    var r: Registeration?
    
    init?(coder: NSCoder, r: Registeration?){
        self.r = r
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @IBOutlet var fistNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailAddressTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet var numbersOfAdults: UILabel!
    @IBOutlet var numbersOfAdultsStepper: UIStepper!
    @IBOutlet var numbersOfChildren: UILabel!
    @IBOutlet var numbersOfChildrenStepper: UIStepper!
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    @IBOutlet var roomTypeLabel: UILabel!
    
    
    var roomType: RoomType?
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "not set"
        }
    }
    
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        
        let selectRoomTypeViewController = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeViewController?.delegate = self
        selectRoomTypeViewController?.selectedRoomType = roomType
        
        return selectRoomTypeViewController
    }
    
    
    @IBAction func cancelButtontapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil )
    }
    
    let checkInIndexPath = IndexPath(row: 1, section: 1)
    let checkOutIndexPath = IndexPath(row: 3, section: 1)
    
    let checkInLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkOutLabelIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckInVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInVisible
        }
    }
    
    var isCheckOutVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutVisible
        }
    }
    
    func updateNumbersOfGuests() {
        numbersOfAdults.text = "\(Int(numbersOfAdultsStepper.value))"
        numbersOfChildren.text = "\(Int(numbersOfChildrenStepper.value))"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInIndexPath where isCheckInVisible == false:
            return 0
        case checkOutIndexPath where isCheckOutVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        if indexPath == checkInLabelIndexPath && isCheckOutVisible == false {
            isCheckInVisible.toggle()
        } else if indexPath == checkOutLabelIndexPath && isCheckInVisible == false {
            isCheckOutVisible.toggle()
        } else if indexPath == checkInLabelIndexPath || indexPath == checkOutLabelIndexPath {
            isCheckInVisible.toggle()
            isCheckOutVisible.toggle()
        } else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
        
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday

        updateDateViews()
        updateNumbersOfGuests()
        updateRoomType()
        updateUI()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func stepperValuechanged(_ sender: UIStepper) {
        updateNumbersOfGuests()
    }
    
    
    func updateUI() {
        if let r = r {
            fistNameTextField.text = r.firstName
            lastNameTextField.text = r.lastName
            emailAddressTextField.text = r.emailAdress
            
            checkInDateLabel.text = dateFormatter.string(from: r.checkInDate)
            checkInDatePicker.date = r.checkInDate
            
            checkOutDateLabel.text = dateFormatter.string(from: r.checkOutDate)
            checkOutDatePicker.date = r.checkOutDate
            
            numbersOfAdults.text = "\(r.numberOfAdults)"
            numbersOfChildren.text = "\(r.numberOfChildren)"
            
            wifiSwitch.isOn = r.wifi
            
            roomType = r.roomType
            roomTypeLabel.text = r.roomType.name
            
        } else {
            return
        }
    }
    
//    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
//        let firstName = fistNameTextField.text ?? ""
//        let lastName = lastNameTextField.text ?? ""
//        let emailAddress = emailAddressTextField.text ?? ""
//        let checkInDate = checkInDatePicker.date
//        let checkOutDate = checkOutDatePicker.date
//        let numberOfAdults = Int(numbersOfAdultsStepper.value)
//        let numberOfChildren = Int(numbersOfChildrenStepper.value)
//
//        let wifiState = wifiSwitch.isOn
//
//        let roomChoice = roomType?.name ?? "Not Set"
//
//        print("Done Tapped")
//        print(firstName)
//        print(lastName)
//        print(emailAddress)
//
//        print(checkInDate)
//        print(checkOutDate)
//        print(numberOfAdults)
//        print(numberOfChildren)
//        print(wifiState)
//        print(roomChoice)
//    }
    
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    
    
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

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
