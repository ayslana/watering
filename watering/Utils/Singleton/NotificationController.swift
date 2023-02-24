//
//  NotificationController.swift
//  watering
//
//  Created by Ayslana Riene on 14/02/23.
//

import UserNotifications

struct NotificationController {
        func requestPermission() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    treatNotificationRequest()
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    
    private func treatNotificationRequest() {
        UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
            case .authorized, .provisional, .ephemeral:
                doNotification()
            case .notDetermined, .denied:
                print("Application Not Allowed to Display Notifications")
            @unknown default:
                print("Application Not Allowed to Display Notifications")
            }
        }
    }
    private func doNotification()  {
        let content = UNMutableNotificationContent()
        content.title = "\(UserDefaults.standard.getPlantName() ?? "Your plant") is thirsty 😟"
        content.body = "Remember to watering it today!"
        let dateComponents = DateComponents(calendar: .current, hour: 9, minute: 30)
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents, repeats: true
        )
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

