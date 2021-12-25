//
//  EditDateCell.swift
//  Today
//
//  Created by Wayne on 2021/7/1.
//

import UIKit

class EditDateCell: UITableViewCell {
    @IBOutlet var datePicker: UIDatePicker!

    func configure(date: Date) {
        datePicker.date = date
    }
    
}
