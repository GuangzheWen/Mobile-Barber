//
//  EditTitleCell.swift
//  Today
//
//  Created by Wayne on 2021/7/1.
//

import UIKit

class EditTitleCell: UITableViewCell {
    @IBOutlet var titleTextField: UITextField!

    func configure(title: String) {
        titleTextField.text = title
    }
}
