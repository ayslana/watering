//
//  NotificationController.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import UserNotifications

struct NotificationController {
    
    func requestPermission() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
<<<<<<< HEAD

=======
    
    
    
>>>>>>> 2aa8ed99d11ad0fc710d6e4658136575e9e8dc24
    func doNotification()  {
        let content = UNMutableNotificationContent()
        content.title = "Sua plantinha está com sede 😟"
        content.subtitle = "Lembre-se de aguá-la hoje!"
        
<<<<<<< HEAD
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 4.0, repeats: false)
=======
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
>>>>>>> 2aa8ed99d11ad0fc710d6e4658136575e9e8dc24
        
        dateComponents.hour = 08
        
<<<<<<< HEAD
        UNUserNotificationCenter.current().add(request)
        print("Deu certo enviar")
    }
}

=======
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents, repeats: true)
    
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}
>>>>>>> 2aa8ed99d11ad0fc710d6e4658136575e9e8dc24
