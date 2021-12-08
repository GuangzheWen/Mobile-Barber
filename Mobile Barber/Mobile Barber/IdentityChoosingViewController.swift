
import UIKit

class IdentityChoosingViewController: UIViewController {

    @IBOutlet var identityIsBarberChoosingSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterButtonTapped(_ sender: UIButton) {
        var homeVC: UIViewController
        if identityIsBarberChoosingSwitch.isOn {
            UserDefaults.standard.setValue(true, forKey: "isBarber")
            
            homeVC = storyboard!.instantiateViewController(identifier: "BarberSideVCID")
        } else {
            UserDefaults.standard.setValue(true, forKey: "isCustomer")
            homeVC = storyboard!.instantiateViewController(identifier: "CustomerSideVCID")
        }
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
