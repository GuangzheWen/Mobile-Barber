

import UIKit

class FindBarberTableViewCell: UITableViewCell {

    @IBOutlet var shopNameLabel: UILabel!
    @IBOutlet var photoProfileImage: UIImageView!
    @IBOutlet var ratePointsLabel: UILabel!
    @IBOutlet var locationDescriptionLabel: UILabel!
    @IBOutlet var serviceTypeLabel: UILabel!
    
    @IBOutlet var fisrtSampleServiceLabel: UILabel!
    @IBOutlet var secondSampleServiceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
