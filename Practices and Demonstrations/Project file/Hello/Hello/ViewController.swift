//
//  ViewController.swift
//  Hello
//
//  Created by Wayne on 2021/11/9.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        myProfile.frame.size = CGSize(width: view.frame.width - 40.0, height: (view.frame.width - 40.0) / 3 * 4)
//        myProfile.backgroundColor = .blue
//        myProfile.contentMode = .scaleToFill
        print(myProfile.frame)
        print(view.frame)
//        print(view.bounds)
//        print(view.safeAreaInsets)
    }


}

