//
//  registerPlantView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI

struct RegisterPlantView: View {
    @State var plantName: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Theme.secondary.ignoresSafeArea()
                Theme.flower
                    .offset(x: UIScreen.main.bounds.width/2.5)
                VStack {
                    Spacer().frame(height: 50)
                    question
                    digiteAqui
                    Divider()
                        .background(Theme.primary)
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
                .foregroundColor(Theme.primary)
                .font(.system(size: 22, design: .rounded))
            Text("of your plant?")
                .foregroundColor(Theme.primary)
                .font(.system(size: 22, design: .rounded))
        }
    }
    var digiteAqui: some View{
        TextField("Type Here", text: $plantName)
            .foregroundColor(Theme.primary)
            .multilineTextAlignment(.center)
            .font(.system(size: 20, design: .rounded))
            .padding()
            .onChange(of: plantName) { newValue in
                savePlantName()
            }
    }
    var navigation: some View {
        NavigationLink(destination: ChoosePlantView().navigationBarHidden(true), label: {
            Text("Next")
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
    func savePlantName() {
        UserDefaults.standard.setPlantName(value: plantName)
    }
}
struct RegisterPlantView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlantView()
    }
}
