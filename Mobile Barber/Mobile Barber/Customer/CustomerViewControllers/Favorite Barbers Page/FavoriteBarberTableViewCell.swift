import UIKit

class FavoriteBarberTableViewCell: UITableViewCell {

    @IBOutlet var shopName: UILabel!
    
    @IBOutlet var photoProfileImage: UIImageView!
    @IBOutlet var ratePointLabel: UILabel!
    @IBOutlet var locationDescriptionLabel: UILabel!
    @IBOutlet var serviceForGenderLabel: UILabel!
    
    @IBOutlet var firstSampleServiceLabel: UILabel!
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
