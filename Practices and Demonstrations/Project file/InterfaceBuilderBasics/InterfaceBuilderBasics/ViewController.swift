//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by Wayne on 2021/11/2.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButton: UIButton!
    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
    }

    @IBAction func pressButton(_ sender: UIButton) {
        myLabel.text = "This is the modified label text."
    }
    
}

