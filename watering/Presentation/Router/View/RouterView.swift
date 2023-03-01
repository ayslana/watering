//
//  MotherView.swift
//  watering
//
//  Created by Ayslana Riene on 22/09/22.
//

import SwiftUI

//A MotherView é uma view que define o fluxo do aplicativo
struct RouterView: View {
    @EnvironmentObject var viewRouter: RouterController
    //o @EnvironmentObject é uma propriedade que permite que você use
    //a variavel em diferentes locais, muitas vezes; e sempre atualizando
    //estado
    //https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-environmentobject-to-share-data-between-views
    //essa é uma maneira mais eficaz de trabalhar com os mesmo dados em diferentes visualizacoes
    var body: some View {
        VStack {
            //se minha variavel currentPage, declarada na ViewRouter for igual
            //a string "FirstAccessView" eu chamo view FirstAccessView
            if viewRouter.currentPage == "FirstAccessView" {
                NavigationView {
                    WelcomeView()
                }
            } else if viewRouter.currentPage == "WateringView" {
                WateringView()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView().environmentObject(RouterController())
    }
}
