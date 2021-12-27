import Foundation
import UIKit
import UserNotifications
import CoreTelephony

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
