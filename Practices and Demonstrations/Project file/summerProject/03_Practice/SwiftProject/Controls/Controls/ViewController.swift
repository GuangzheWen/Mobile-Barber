//
//  ViewController.swift
//  Controls
//
//  Created by 温广哲 on 2021/6/1.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Button pressed. ")
        if `switch`.isOn {
            print("Switch is on. ")
        }else {
            print("Switch is off. ")
        }
        print("Value of slider: \(slider.value)")
        print("Content of text field: \(textField.text!)")
    }
    
    
    
    @IBAction func switchToggle(_ sender: UISwitch) {
        print("Switch toggled. ")
    }
    

    @IBAction func sliderValueChanged1(_ sender: UISlider) {
        print(sender.value)
    }
    
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        // print(sender.text!)
    }
    
    
    @IBAction func respondToGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
}

