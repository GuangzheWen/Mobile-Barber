//
//  ViewController.swift
//  q1
//
//  Created by Wayne on 2021/11/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        prepare(sender: sender)
    }
    
}

class SecondViewController: UIViewController {
  var names: [String]?
}

func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  let secondVC = segue.destination as! SecondViewController
  secondVC.names = ["Peter", "Jamie", "Tricia"]
}
