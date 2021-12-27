import Foundation
import Photos

import UIKit
import UserNotifications
import CoreTelephony

// reuqesting permission of photo library by alert window 请求授权相册
func authorizingPhotoLibrary (vc: UIViewController) {
    // firstly retrieve the status of permission 首先获取状态
    let photoLibraryStatus  = PHPhotoLibrary.authorizationStatus()
    
    // handling by different status of the permission 根据不同的状态进行不同的操作
    switch photoLibraryStatus {
    // have not chosen
    case .notDetermined:
        print("not asked for user auth")
        PHPhotoLibrary.requestAuthorization { status in
            authorizingPhotoLibrary(vc: vc)
        }
    // permitted
    case .authorized:
        print("read photo library")
    // haven't permitted thoroughly or partially
    default:
        DispatchQueue.main.async {
            let alert  = UIAlertController(title: "Photo access limited", message: "Click righ-hand side Setting button", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let settingAction = UIAlertAction(title: "Setting", style: .default) { action in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }
            alert.addAction(cancelAction)
            alert.addAction(settingAction)
            vc.present(alert, animated: true)
        }
        
    }
   
}



// ask for permission of notification
func authorizingNotification() {
    // 请求通知权限
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { // 横幅，声音，标记
            (accepted, error) in
            if !accepted {
                print("用户不允许通知")
            }
    }
}


