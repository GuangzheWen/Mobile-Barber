import Foundation
import UIKit
import CoreLocation

// ask for permission of location
var managerOfLocation = CLLocationManager()

func authorizingLocation () {
//    print(9)
    let loactionStatus = CLLocationManager.authorizationStatus()
    
    switch loactionStatus {
    case .notDetermined:
        managerOfLocation.requestWhenInUseAuthorization()
    default:
        print("cannot access permission")
    }
}
