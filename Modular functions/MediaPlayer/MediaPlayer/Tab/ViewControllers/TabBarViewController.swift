//
//  TabBarViewController.swift
//  MediaPlayer
//
//  Created by 温广哲 on 2021/12/26.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let feedRootVC = FeedRootViewController()
        addChildViewController(childViewController: feedRootVC, title: "Home")
        
        let friendRootVC = FriendRootViewController()
        addChildViewController(childViewController: friendRootVC, title: "Friend")
        
        let cameraRootVC = CameraRootViewController()
        let addImage = UIImage(named: "icon_home_add")?.withRenderingMode(.alwaysOriginal)
        addChildViewController(childViewController: cameraRootVC, title: nil, image: addImage, selectedImage: addImage)
        
        let messageRootVC = MessageRootViewController()
        addChildViewController(childViewController: messageRootVC, title: "Message")
        
        let profileRootVC = ProfileRootViewController()
        addChildViewController(childViewController: profileRootVC, title: "Me")
        
    }
    
    private func addChildViewController(childViewController: UIViewController, title: String?, image: UIImage? = nil, selectedImage: UIImage? = nil) {
        let navigationController = UINavigationController(rootViewController: childViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        let tabBarItem = navigationController.tabBarItem
        tabBarItem?.title = title
        tabBarItem?.image = image
        tabBarItem?.selectedImage = selectedImage
        
        if let _ = title {
            tabBarItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red,
                                                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
                                               ], for: UIControl.State.normal)
            
            tabBarItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue,
                                                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
                                               ], for: UIControl.State.selected)
            tabBarItem?.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
//            tabBar.barTintColor = .gray
//            tabBar.backgroundColor = .gray
        } else {
            tabBarItem?.imageInsets = UIEdgeInsets(top: 5.5, left: 0, bottom: -5.5, right: 0)
        }
        
        addChild(navigationController)
        
    }
  
}
