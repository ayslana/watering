//
//  registerPersonView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SwiftUI

// State -> Binding (structs)
// StateObject -> ObservedObject (classes) //Primeira vez StateObject, outras vezes ObservedObject

struct RegisterUserNameView: View {

    @StateObject var controller = RegisterUserNameController()

    var body: some View {
        NavigationView {
            ZStack {
                Image("Flower")
                    //.resizable()
                    .fixedSize()
                    .scaledToFit()
                    .alignmentGuide(.trailing) { dimension in
                        dimension[.trailing] - 70
                    }
                    .frame(alignment: .trailing)
                VStack {
                    Spacer().frame(height: 50)

                    Text("What is your name?")
                        .foregroundColor(ThemeEnum.primary)
                        .font(.title2)

                    TextField("Type Here", text: $controller.personName)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding()
                        .onChange(of: controller.personName) { newValue in
                            controller.saveName()
                        }

                } //EOV

                ZStack {
                    if (!controller.personName.isEmpty && controller.personName.count >= 5) {

                        Divider()
                            .background(ThemeEnum.primary)
                            .frame(width: 300)
                            .padding(.top, -10)

                        Spacer()
                            .frame(height: 50)

                        NavigationLink(destination: RegisterPlantNameView()
                            .navigationBarHidden(true),
                               label: {
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
                        .padding(.top, 100)
                    }
                }//EOZ
                .padding(.top, 200)
            }//EOZ
            .background(Color(UIColor.systemBackground))
            .navigationBarBackButtonHidden(true)
        }
    }

    struct RegisterUserNameView_Preview : PreviewProvider {
        static var previews: some View {
            RegisterUserNameView()
        }
    }

    

}
