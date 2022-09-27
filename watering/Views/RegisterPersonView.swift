//
//  registerPersonView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SwiftUI

enum Theme {
    static let primary = Color("Primary")
    static let secondary = Color("Secondary")
    static let water = Color("Water")
    static let font = Color("Font")
    static let firstview = Color("FirstView")
    static let firstfont = Color("FirstFont")
}

struct RegisterPersonView: View {
  
    var body: some View {

        Theme.secondary.ignoresSafeArea()

        NavigationView {

            ZStack (alignment: .top){
                Theme.secondary.ignoresSafeArea()

                NameUser(userName: "")

            }

        }.navigationBarBackButtonHidden(true)
    }
}

struct NameUser : View {

    @State var userName: String = ""
    @State var savedName: String = ""

    var body: some View {

    VStack {
        Spacer().frame(height: 200)

        Text("Qual o seu nome?")
            .foregroundColor(Theme.primary)
            .font(.system(size: 30, design: .rounded))

        TextField("Seu nome", text: $userName)
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .font(.system(size: 25, design: .rounded))
            .padding()
            .onChange(of: userName) { newValue in
                saveName()
            }
        Divider()
            .background(Theme.primary)
            .frame(width: 300)

        Spacer().frame(height: 50)

        NavigationLink(destination: RegisterPlantView(savedNamePlant: "", savedName: savedName).navigationBarHidden(true), label: {
            Text("Próximo")
                .foregroundColor(Theme.primary)
                .padding()
                .frame(width: 200, height: 50)
                .font(.system(size: 25, design: .rounded))
                .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Theme.primary, lineWidth: 2))
                .padding()
                .cornerRadius(20)

            }
        )

        Spacer().frame(height: 146)

        }
    }
    func saveName() {
        UserDefaults.standard.set(self.userName, forKey: "userName")
    }
}

struct RegisterPersonView_Preview : PreviewProvider {
    static var previews: some View {
        RegisterPersonView()
    }
}
