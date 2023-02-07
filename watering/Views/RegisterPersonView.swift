//
//  registerPersonView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SwiftUI


struct RegisterPersonView: View {
    var body: some View {
        Theme.secondary.ignoresSafeArea()
        NavigationView {
            ZStack (alignment: .top){
                Theme.secondary.ignoresSafeArea()
                NameUser()
            }
        }.navigationBarBackButtonHidden(true)
    }
}
struct RegisterPersonView_Preview : PreviewProvider {
    static var previews: some View {
        RegisterPersonView()
    }
}
