//
//  MotherView.swift
//  watering
//
//  Created by Ayslana Riene on 22/09/22.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            if viewRouter.currentPage == "FirstAccessView" {
                FirstAccessView()
            } else if viewRouter.currentPage == "WateringView" {
                WateringView(idPlant: 0, typePlant: "", modelNamePlant: "")
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
