//
//  ViewRouter.swift
//  watering
//
//  Created by Ayslana Riene on 22/09/22.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    // ObservableObject é um protocolo que armazena uma instancia de um objeto.
    // Ele permite que que essas instancias sejam utilizadas em diferentes views
    // e quando essas instancias são alteradas a sua visualizacao é recarregada
    @Published var currentPage: String = ""
    //@Published indica que as alterações devem acionar recarregamente na visualizacao
    
    init() {
        //Todo aplicativo tem por padrao um booleano que indica se aquele aplicativo já foi
        //iniciado ou não
        //Tradução desse if: se o booleano atribuido à chave "didLaunchBefore"
        //for falso(!), então é a primeira vez que o aplicativo é inicializado
        // o .set é o mesmo que "escreva isso no lugar do que estava antes"
        // logo escreva que agora o bool atribuido à chave é true
        // e vá pra tela identificada pela string "FirstAccessView"
        // essa atribuicao a telas vai ocorrer na MotherView
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "FirstAccessView"
        }
        else {
            //na pasta UserdefaultsController nós temos algumas funcoes que verificam
            //a existencia de valores em seu corpo
            //Nós colocamos essa parte pq caso o usuario saisse do aplicativo sem completar
            //o cadastro inicial, na proxima vez q ele entrasse ia pra uma tela default
            //entao com esses if, caso o usuario saia da aplicacao sem preencher um dos campos obrigatorios
            //ele deve voltar pra tela inicial
            if (UserDefaults.standard.getPersonName() == nil) {
                currentPage = "FirstAccessView"
            }
            else if (UserDefaults.standard.getPlantName() == nil) {
                currentPage = "FirstAccessView"
            }
            else if (UserDefaults.standard.getPlantType() == nil) {
                currentPage = "FirstAccessView"
            }
            //caso o booleano ja for true, ou seja, o usuario já tiver entrado no aplicativo
            //ele deve ser levado pra tela "WateringView"
            else if UserDefaults.standard.bool(forKey: "didLaunchBefore") {
                currentPage = "WateringView"
            }
        }
    }
}
