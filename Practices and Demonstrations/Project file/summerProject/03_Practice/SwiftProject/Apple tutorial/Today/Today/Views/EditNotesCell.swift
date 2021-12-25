//
//  EditNotesCell.swift
//  Today
//
//  Created by Wayne on 2021/7/1.
//

import UIKit

class EditNotesCell: UITableViewCell {
    @IBOutlet var notesTextView: UITextView!
    
    
    func configure(notes: String?) {
        notesTextView.text = notes
    }
}
