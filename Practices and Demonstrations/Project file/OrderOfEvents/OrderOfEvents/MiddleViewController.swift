//
//  MIddleViewController.swift
//  OrderOfEvents
//
//  Created by Wayne on 2021/11/20.
//

import UIKit

class MiddleViewController: UIViewController {

    
    @IBOutlet var middleViewLabel: UILabel!
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addEvent(from: "view did load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addEvent(from: "view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addEvent(from: "view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        addEvent(from: "view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        addEvent(from: "view did disappear")
    }
    
    func addEvent(from: String) {
        if let text = middleViewLabel.text {
            middleViewLabel.text = text + "\nEvent Number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }

   

}
