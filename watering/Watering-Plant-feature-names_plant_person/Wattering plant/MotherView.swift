//
//  MotherView.swift
//  Wattering plant
//
//  Created by Maria Letícia Dutra de Oliveira on 22/09/22.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "FirstVisitView" {
                FirstVisitView()
            } else if viewRouter.currentPage == "PrincipalView" {
                PrincipalView()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
