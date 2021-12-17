
import UIKit

class FindBarberDetailViewController: UIViewController {

    var barber: Barber?
    
    @IBOutlet var shopNameLabel: UILabel!
    @IBOutlet var photoProfileImage: UIImageView!
    
    @IBOutlet var servicesTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let barber = barber {
            shopNameLabel.text = barber.shopName
            navigationItem.title = barber.shopName
            photoProfileImage.image = UIImage(named: barber.photoProfile)
        }
        
//        let serviceAndPrice = [
//            "Basic haircut": "10",
//            "Hair washing": "5",
//            "Perm": "30"
//        ]
//        for index in 0..<servicesTableView.numberOfRows(inSection: 0) {
//            servicesTableView.cellForRow(at: IndexPath(row: index, section: 0))?.textLabel?.text = "123"
//        }
        
        
        

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
