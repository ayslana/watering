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
    static let secondary = Color("Secundary")
    static let water = Color("Water")
    static let font = Color("Font")
    static let firstview = Color("FirstView")
    static let firstfont = Color("FirstFont")
    static let flower = Image("Flower")
    static let flower2 = Image("Flower2")
}

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

struct NameUser : View {
    
    @State var personName: String = ""

    
    var body: some View {
        ZStack{
            Theme.flower
                .offset(x:UIScreen.main.bounds.width/2.5)
            VStack {
                Spacer().frame(height: 50)
                Text("Qual o seu nome?")
                    .foregroundColor(Theme.primary)
                    .font(.system(size: 28, design: .rounded))

                TextField("Digite Aqui", text: $personName)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.system(size: 24, design: .rounded))
                    .padding()
                    .onChange(of: personName) { newValue in
                        saveName()
                    }
                Divider()
                    .background(Theme.primary)
                    .frame(width: 300)
                Spacer().frame(height: 50)

                NavigationLink(destination: RegisterPlantView().navigationBarHidden(true), label: {
                    Text("Próximo")
                        .foregroundColor(Theme.primary)
                        .padding()
                        .frame(width: 200, height: 50)
                        .font(.system(size: 20, design: .rounded))
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Theme.primary, lineWidth: 2))
                        .padding()
                        .cornerRadius(20)
                }
                )
            }
        }
    }
    
    func saveName() {
        UserDefaults.standard.setPersonName(value: personName)
    }
    
}

struct RegisterPersonView_Preview : PreviewProvider {
    static var previews: some View {
        RegisterPersonView()
    }
}
