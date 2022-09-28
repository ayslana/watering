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
                    Group {
                        Text("Qual o nome da ")
                            .foregroundColor(Theme.primary)
                            .font(.system(size: 24, design: .rounded))
                        Text("sua plantinha? ")
                            .foregroundColor(Theme.primary)
                            .font(.system(size: 24, design: .rounded))
                    }


                    TextField("Digite Aqui", text: $plantName)
                        .foregroundColor(Theme.primary)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, design: .rounded))
                        .padding()
                        .onChange(of: plantName) { newValue in
                            savePlantName()
                        }
                    Divider()
                        .background(Theme.primary)
                        .frame(width: 300)
                    Spacer().frame(height: 50)

                    NavigationLink(destination: ChoosePlantView().navigationBarHidden(true), label: {
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
