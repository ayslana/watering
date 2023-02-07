//
//  NameUser.swift
//  Watering
//
//  Created by Narely Lima on 29/09/22.
//

import Foundation
import SwiftUI

struct UserNameView : View {
    @State var personName: String = ""
//    let notification = NotificationController()
    var body: some View {
        ZStack{
            ThemeEnum.flower
                .offset(x:UIScreen.main.bounds.width/2.5)
            VStack {
                Spacer().frame(height: 50)
                question
                digiteAqui
                Divider()
                    .background(ThemeEnum.primary)
                    .frame(width: 300)
                Spacer().frame(height: 50)
                navigation

            }
        }
    }
    var question: some View {
        Text("What is your name?")
            .foregroundColor(ThemeEnum.primary)
            .font(.system(size: 22, design: .rounded))

    }
    var digiteAqui: some View{
        TextField("Type Here", text: $personName)
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .font(.system(size: 20, design: .rounded))
            .padding()
            .onChange(of: personName) { newValue in
                saveName()
            }
    }
    var navigation: some View {
        NavigationLink(destination: RegisterPlantNameView().navigationBarHidden(true), label: {
            Text("Next")
                .foregroundColor(ThemeEnum.primary)
                .padding()
                .frame(width: 200, height: 50)
                .font(.system(size: 20, design: .rounded))
                .overlay(RoundedRectangle(cornerRadius: 15)
                    .stroke(ThemeEnum.primary, lineWidth: 2))
                .padding()
                .cornerRadius(20)
        }
        )
    }
    func saveName() {
        UserDefaults.standard.setPersonName(value: personName)
//        notification.requestPermission()
    }

}
