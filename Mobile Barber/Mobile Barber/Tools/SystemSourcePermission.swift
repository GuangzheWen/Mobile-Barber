import Foundation
import Photos
import CoreLocation
import UIKit
import UserNotifications
import CoreTelephony

// 请求授权相册
func authorizingPhotoLibrary (vc: UIViewController) {
    // 首先获取状态
    let photoLibraryStatus  = PHPhotoLibrary.authorizationStatus()
    
    // 根据不同的状态进行不同的操作
    switch photoLibraryStatus {
    case .notDetermined:
        print("not asked for user auth")
        PHPhotoLibrary.requestAuthorization { status in
            authorizingPhotoLibrary(vc: vc)
        }

    case .authorized:
        print("read photo library")
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

var managerOfLocation = CLLocationManager()

func authorizingLocation () {
    print(9)
    let loactionStatus = CLLocationManager.authorizationStatus()
    
    switch loactionStatus {
    case .notDetermined:
        managerOfLocation.requestWhenInUseAuthorization()
    default:
        print(12)
    }

    
}

func authorizingNotification() {
    // 请求通知权限
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { // 横幅，声音，标记
            (accepted, error) in
            if !accepted {
                print("用户不允许通知")
            }
    }
}


