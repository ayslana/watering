//Biblioteca que permite notificacoes locais no projeto
//https://cocoacasts.com/local-notifications-with-the-user-notifications-framework
//https://www.hackingwithswift.com/read/21/2/scheduling-notifications-unusernotificationcenter-and-unnotificationrequest
import UserNotifications

struct NotificationController {
    func requestPermission() {
        // UNUserNotificationCenter: solicita ao UserNotifications se o aplicativo tem permissao de
        // exibir notificacoes
        // .current(): é uma classe que recebe o retorno da UNUserNotificationCenter
        // requestAuthorization: essa é a funcao que solicita permissao para mandar notificacoes
        // ao usuario. Essa funcao retorna um booleano que sera interpretado pela UNUserNotificationCenter
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    // funcao que chamarei onde que quero que seja solicitada a permissao
    func doNotification()  {
        //UNMutableNotificationContent(): é a classe que permite a personalizacao da notificacao
        let content = UNMutableNotificationContent()
        content.title = "\(UserDefaults.standard.getPlantName() ?? "") is thirsty 😟"
        content.body = "Remember to watering it today!"
        //DateComponents(): é uma classe que representa uma data de diferentes formas: min, seg, horas...
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = 08

//        dateComponents.day = 
        
        // UNCalendarNotificationTrigger(): é a classe que permite mostrar uma notificaçao em uma data
        // especifica.
        // Logo, no calendario atual, quando der 8 horas a notificacao vai aparecer
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents, repeats: true)
        // O UUID() permite que cada notificacao tenha um identificador exclusivo
        // esse identificador serve para que no lugar de sempre criar uma notificacao nova
        // caso o valor tenha sido alterado, a notificacao seja apenas atualizada
        let uuidString = UUID().uuidString
        // UNNotificationRequest(): é a classe que faz esse agendamento da notificacao local
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        // aqui envia a solicitacao para saber se ja foi autorizada a acao de enviar a notificacao
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
