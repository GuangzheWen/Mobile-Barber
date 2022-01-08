import Foundation
import UIKit

import CoreTelephony
import UserNotifications
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

func switchToBarberModeNotification(){
    // 1. Notification Content
    let content = UNMutableNotificationContent()
    content.sound = UNNotificationSound.default      // to add a sound
    content.badge = 2                                // to add a badge
    content.title = "Switched mode"
    content.body = "Welcome to Barber mode!"

    
 
    // 2. Notification Trigger
    let timeIntervalTrigger =
       UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
 
    // 3. Notification Request
    let request = UNNotificationRequest(identifier: "SwitchToB",
       content: content, trigger: timeIntervalTrigger)
 
    UNUserNotificationCenter.current().add(request) { (error: Error?) in
        if let error = error {
            print(error.localizedDescription)
        }
    }
}

func switchToCustomerModeNotification(){
    // 1. Notification Content
    let content = UNMutableNotificationContent()
    content.sound = UNNotificationSound.default      // to add a sound
    content.badge = 2                                // to add a badge
    content.title = "Switched mode"
    content.body = "Welcome to Customer mode!"

    
 
    // 2. Notification Trigger
    let timeIntervalTrigger =
       UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
 
    // 3. Notification Request
    let request = UNNotificationRequest(identifier: "SwitchToC",
       content: content, trigger: timeIntervalTrigger)
 
    UNUserNotificationCenter.current().add(request) { (error: Error?) in
        if let error = error {
            print(error.localizedDescription)
        }
    }
}
