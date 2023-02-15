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
    
    func treatNotificationRequest() {
        UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
            case .notDetermined:
                print("Application Not Allowed to Display Notifications")
            case .authorized:
                doNotification()
            case .denied:
                print("Application Not Allowed to Display Notifications")
            case .provisional:
                doNotification()
            case .ephemeral:
                doNotification()
            @unknown default:
                print("Application Not Allowed to Display Notifications")
            }
        }
    }
    func doNotification()  {
        let content = UNMutableNotificationContent()
        content.title = "\(UserDefaults.standard.getPlantName() ?? "Your plant") is thirsty 😟"
        content.body = "Remember to watering it today!"
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = 09
        dateComponents.minute = 30
        
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

