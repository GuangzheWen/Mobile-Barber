//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Wayne on 2021/12/10.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    weak var delegate: ToDoTableViewCellDelegate?
    
    @IBOutlet var isCompletionButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func isCompeteButtonTapped(_ sender: UIButton) {
        delegate?.checkMarkTapped(sender: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol ToDoTableViewCellDelegate: AnyObject {
    func checkMarkTapped(sender: ToDoTableViewCell)
}
