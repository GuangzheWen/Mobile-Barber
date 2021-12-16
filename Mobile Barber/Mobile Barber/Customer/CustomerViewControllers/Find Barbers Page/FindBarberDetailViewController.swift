
import UIKit

class FindBarberDetailViewController: UIViewController {

    var barber: Barber?
    
    @IBOutlet var shopNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let barber = barber {
            shopNameLabel.text = barber.shopName
        }

        // Do any additional setup after loading the view.
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
