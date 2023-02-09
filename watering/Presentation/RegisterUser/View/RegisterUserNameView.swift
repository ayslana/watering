//
//  registerPersonView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SwiftUI


struct RegisterUserNameView: View {
    var body: some View {
        ThemeEnum.secondary.ignoresSafeArea()
        NavigationView {
            ZStack (alignment: .top){
                ThemeEnum.secondary.ignoresSafeArea()
                UserNameView()
            }
        }.navigationBarBackButtonHidden(true)
    }
}
struct RegisterUserNameView_Preview : PreviewProvider {
    static var previews: some View {
        RegisterUserNameView()
    }
}
