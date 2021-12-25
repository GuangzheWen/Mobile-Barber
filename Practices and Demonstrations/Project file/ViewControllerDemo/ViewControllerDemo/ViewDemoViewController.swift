//
//  ViewDemoViewController.swift
//  ViewControllerDemo
//
//  Created by Wayne on 2021/10/7.
//

import UIKit


class ViewDemoViewController: UIViewController {
    
    private let viewA:UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewA.backgroundColor = .green
        view.addSubview(viewA)
        
        viewA.layer.borderWidth = 10
        viewA.layer.borderColor = UIColor.orange.cgColor
        viewA.layer.cornerRadius = 50
        viewA.layer.masksToBounds = true
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(<#T##@objc method#>))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewA.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 300, height: 300)
    }
    
    

}
