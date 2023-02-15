//
//  registerPlantView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI
import Foundation

struct RegisterPlantNameView: View {
    @StateObject var controller = RegisterPlantNameController()

    var body: some View {
        NavigationView {
            ZStack {
                //ThemeEnum.secondary.ignoresSafeArea()
                ThemeEnum.flower
                    //.offset(x: UIScreen.main.bounds.width/2.5)
                    .fixedSize()
                    .scaledToFit()
                    .alignmentGuide(.trailing) { dimension in
                        dimension[.trailing] - 70
                    }
                    .frame(alignment: .trailing)
                VStack {
                    Spacer().frame(height: 50)
                    Text("What is the name of your plant?")
                        .foregroundColor(ThemeEnum.primary)
                        .font(.title2)
                    TextField("Type Here", text: $controller.plantName)
                        .foregroundColor(ThemeEnum.primary)
                        .multilineTextAlignment(.center)
                        .font(.title3)                        .padding()
                        .onChange(of: controller.plantName) { newValue in
                            controller.savePlantName()
                        }


                } //EOV
                ZStack {
                    if (!controller.plantName.isEmpty && controller.plantName.count >= 5) {
                        Divider()
                            .background(ThemeEnum.primary)
                            .frame(width: 300)
                            .padding(.top, -10)
                        Spacer()
                            .frame(height: 50)

                        NavigationLink(destination: RegisterPlantTypeView().navigationBarHidden(true), label: {
                                Text("Next")
                                    .foregroundColor(ThemeEnum.primary)
                                    .padding()
                                    .frame(width: 200, height: 50)
                                    .font(.title3)
                                    .overlay(RoundedRectangle(cornerRadius: 15)
                                        .stroke(ThemeEnum.primary, lineWidth: 2))
                                    .padding()
                                    .cornerRadius(20)
                            }
                        )
                        .padding(.top,100)
                    }
                }//EOZ
                .padding(.top,200)
            } //EOZ
            .background(Color(UIColor.systemBackground))
            .navigationBarBackButtonHidden(true)
        }
    }
}
struct RegisterPlantNameView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlantNameView()
    }
}
