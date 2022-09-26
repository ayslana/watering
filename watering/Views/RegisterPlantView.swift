//
//  registerPlantView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI

struct RegisterPlantView: View {
    
    @State var textFieldPlant: String = ""
    
    var body: some View {
        
        NavigationView {
            
            ZStack (alignment: .top) {
                Theme.secondary.ignoresSafeArea()
                
                VStack {
                    
                    Text("Qual o nome da sua plantinha?")
                        .foregroundColor(Theme.primary)
                        .font(.system(size: 20, design: .rounded))

                    TextField(" ", text: $textFieldPlant)
                        .foregroundColor(Theme.primary)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, design: .rounded))
                        .padding()

                    
                    Divider()
                        
                        .background(Theme.primary)
                        .frame(width: 300)
                        
                    
                    
                    Spacer().frame(height: 100)

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
                
                .padding()
                    
                }
                Spacer().frame(height: 484)
            }
        }
    }


struct RegisterPlantView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlantView()
    }
}