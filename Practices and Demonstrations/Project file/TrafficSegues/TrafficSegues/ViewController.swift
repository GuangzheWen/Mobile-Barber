//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Wayne on 2021/11/16.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var toggleSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func yButton(_ sender: UIButton) {
        if toggleSwitch.isOn {
            performSegue(withIdentifier: "Yellow", sender: nil)
        }
    }
    
    
    @IBAction func gButton(_ sender: UIButton) {
        if !toggleSwitch.isOn {
            performSegue(withIdentifier: "Green", sender: nil)
        }
    }
    
    @IBAction func backMain(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func toggled(_ sender: UISwitch) {
        if toggleSwitch.isOn {
            print(1)
//            shouldPerformSegue(withIdentifier: "Yellow", sender: nil)
            performSegue(withIdentifier: "Yellow", sender: nil)
        } else {
            print(2)
            shouldPerformSegue(withIdentifier: "Green", sender: nil)
        }
    }
    
}

