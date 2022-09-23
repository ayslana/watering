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
    
        

    func doNotification()  {
        let content = UNMutableNotificationContent()
        content.title = "Sua plantinha está com sede 😟"
        content.subtitle = "Lembre-se de aguá-la hoje!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
        }

