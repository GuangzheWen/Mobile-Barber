//
//  ViewController.swift
//  AppEventCount
//
//  Created by Wayne on 2021/12/2.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var appDidLaunch: UILabel!
    @IBOutlet var appConfigured: UILabel!
    
    @IBOutlet var sceneWillConnect: UILabel!
    @IBOutlet var sceneDidActive: UILabel!
    @IBOutlet var sceneWillResignActive: UILabel!
    @IBOutlet var sceneWillForeground: UILabel!
    @IBOutlet var sceneDidBackground: UILabel!
    
    var sceneWillConnectCount = 0
    var sceneDidActiveCount = 0
    var sceneWillResignActiveCount = 0
    var sceneWillForegroundCount = 0
    var sceneDidBackgroundCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        updateView()
    }


    
    func updateView() {
        appDidLaunch.text = "\(appDelegate.lauchCount)"
        appConfigured.text = "\(appDelegate.configurationForConnectingCount)"
        
        sceneWillConnect.text = "\(sceneWillConnectCount)"
        sceneDidActive.text = "\(sceneDidActiveCount)"
        sceneWillResignActive.text = "\(sceneWillResignActiveCount)"
        sceneWillForeground.text = "\(sceneWillForegroundCount)"
        sceneDidBackground.text = "\(sceneDidBackgroundCount)"
    }

}

