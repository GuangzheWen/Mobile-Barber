//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Wayne on 2021/11/9.
//

import UIKit

class ViewController: UIViewController {



    
    
    @IBOutlet var a: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        a.addTarget(self, action: #selector(b(_:)), for: .touchUpInside)
        
        
      
                
    }
    

    @IBAction func b(_ sender: UIButton) {
        print(1)
    }
    
    
}

