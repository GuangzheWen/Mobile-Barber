
import UIKit

class AppointmentTableViewCell: UITableViewCell {
    
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var timeOfPaymentLabel: UILabel!
    @IBOutlet var customerNameLabel: UILabel!
    @IBOutlet var barberShopLabel: UILabel!
    @IBOutlet var serviceTypeLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var dateToServeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
