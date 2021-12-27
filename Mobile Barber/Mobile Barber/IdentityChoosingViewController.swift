import UIKit


class IdentityChoosingViewController: UIViewController {

    // choosing identity buttons for barber and customer
    @IBOutlet var identityIsBarberChoosingSwitch: UISwitch!
    @IBOutlet var identityIsCustomerChoosingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // defualtly set to off
//        identityIsBarberChoosingSwitch.isOn = false
//        identityIsCustomerChoosingSwitch.isOn = false
        
    }
    
//    submit button
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        // used for homeVC later to show
        var homeVC: UIViewController
        if identityIsBarberChoosingSwitch.isOn {
            // set static global consistent key store indentity for barber
            UserDefaults.standard.setValue(true, forKey: "isBarber")
            // this time segue to barber root view
            homeVC = storyboard!.instantiateViewController(identifier: "BarberSideVCID")
        } else if identityIsCustomerChoosingSwitch.isOn {
            // set static global consistent key store indentity for customer
            UserDefaults.standard.setValue(true, forKey: "isCustomer")
            // this time, segue to customer root view
            homeVC = storyboard!.instantiateViewController(identifier: "CustomerSideVCID")
        } else {
            // doing nothing if user didn't choose any identity
            return
        }
        
        // configure homeVC display mode to full screen
        homeVC.modalPresentationStyle = .fullScreen
        // display it !
        present(homeVC, animated: true, completion: nil)
    }
    
    // make two buttons keep always different
    @IBAction func isBarberSwitchChosen(_ sender: UISwitch) {
        identityIsCustomerChoosingSwitch.isOn = !identityIsBarberChoosingSwitch.isOn
    }
    
    @IBAction func isCustomerSwitchChosen(_ sender: UISwitch) {
        identityIsBarberChoosingSwitch.isOn = !identityIsCustomerChoosingSwitch.isOn
    }
}
