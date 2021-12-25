//
//  ViewController.swift
//  Light-20210526
//
//  Created by 温广哲 on 2021/5/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var isLightOn: Bool = true
    
    @IBOutlet weak var myButton: UIButton!
    @IBAction func buttonPressed(_ sender: Any) {
        lightChange()
        isLightOn.toggle()
    }
    
    func lightChange() {
        if isLightOn {
            view.backgroundColor = .black
            myButton.setTitle("Light on", for: .normal)
        } else {
            view.backgroundColor = .white
            myButton.setTitle("Light off", for: .normal)
        }
    }
    
}

