//
//  ViewController.swift
//  Login
//
//  Created by Wayne on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var forgetUsernameButton: UIButton!
    @IBOutlet var forgetPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {
            return
        }

        switch sender {
        case forgetUsernameButton:
            segue.destination.navigationItem.title = "Forget username"
        case forgetPasswordButton:
            segue.destination.navigationItem.title = "Forget password"
        default:
            segue.destination.navigationItem.title = username.text
        }
        
    }
    
    @IBAction func forgetUsenameButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: sender)
    }
    
    @IBAction func forgetPasswordButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: sender)
    }
    
}

