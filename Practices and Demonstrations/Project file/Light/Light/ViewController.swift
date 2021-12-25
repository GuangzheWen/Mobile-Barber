//
//  ViewController.swift
//  Light
//
//  Created by Wayne on 2021/11/3.
//

import UIKit

class ViewController: UIViewController {

    
    var lightState = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        lightButton.setTitle("Turn off", for: .normal)

//        lightLabel.text = lightState ? "is On" : "is Off"
        updateUI()
    }
    

        


    fileprivate func updateUI() {
        view.backgroundColor = lightState ? .white : .black
//        lightButton.setTitle(lightState ? "Turn off" : "Turn on", for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
//        first version
//        if lightState == true {
//            view.backgroundColor = .black
//            lightState.toggle()
//            lightButton.setTitle("Turn on", for: .normal)
//            lightLabel.text = lightState ? "is On" : "is Off"
//        } else {
//            view.backgroundColor = .white
//            lightState.toggle()
//            lightButton.setTitle("Turn off", for: .normal)
//            lightLabel.text = lightState ? "is On" : "is Off"
//        }
        
//        second version
        lightState.toggle()
        updateUI()
        
        
    }
    
}

