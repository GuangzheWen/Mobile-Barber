//
//  ViewController.swift
//  TwoButtons
//
//  Created by Wayne on 2021/11/9.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeButton(_ sender: UIButton) {
        if let text = textField.text {
            myLabel.text = text
        }
    }
    @IBAction func clearButton(_ sender: UIButton) {
        textField.text = ""
    }
    
}

