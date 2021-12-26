import Foundation
import UIKit

extension UIViewController {

//    add child viewcontroller,
//    and add child view,
//    child view controller to parent,
//    pass child view to layout closure
    
    func addChild(childViewController: UIViewController?, layout:(_ view: UIView) -> Void) {
        guard let  childViewController = childViewController else {
            return
        }

        view.addSubview(childViewController.view)
        addChild(childViewController)
        childViewController.didMove(toParent: self)

        layout(childViewController.view)
    }

}
