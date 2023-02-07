//
//  registerPlantView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI

struct RegisterPlantNameView: View {
    @State var plantName: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                ThemeEnum.secondary.ignoresSafeArea()
                ThemeEnum.flower
                    .offset(x: UIScreen.main.bounds.width/2.5)
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
    }
    var question: some View {
        Group {
            Text("What is the name")
                .foregroundColor(ThemeEnum.primary)
                .font(.system(size: 22, design: .rounded))
            Text("of your plant?")
                .foregroundColor(ThemeEnum.primary)
                .font(.system(size: 22, design: .rounded))
        }
    }
    var digiteAqui: some View{
        TextField("Type Here", text: $plantName)
            .foregroundColor(ThemeEnum.primary)
            .multilineTextAlignment(.center)
            .font(.system(size: 20, design: .rounded))
            .padding()
            .onChange(of: plantName) { newValue in
                savePlantName()
            }
    }
    var navigation: some View {
        NavigationLink(destination: RegisterPlantTypeView().navigationBarHidden(true), label: {
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
    func savePlantName() {
        UserDefaults.standard.setPlantName(value: plantName)
    }
}
struct RegisterPlantView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlantNameView()
    }
}
