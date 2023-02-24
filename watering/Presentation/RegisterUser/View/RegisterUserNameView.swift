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
        ZStack {
            ThemeEnum.flower
                .resizable()
                .alignmentGuide(.trailing) { dimension in
                    dimension[.trailing] - 70
                }
                .frame(alignment: .trailing)
//                .resizable()
//                .fixedSize()
//                .scaledToFit()
//                .alignmentGuide(.trailing) { dimension in
//                    dimension[.trailing] - 70
//                }
//                .frame(alignment: .trailing)
            VStack {
                Spacer().frame(height: 50)

                Text("What is your name?")
                    .foregroundColor(ThemeEnum.font)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .font(.title2)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.9
                    )

                TextField("Type Here", text: $controller.personName)
                    .multilineTextAlignment(.center)
                    .foregroundColor(ThemeEnum.font)
                    .font(.body)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.8
                    )
                    .onChange(of: controller.personName) { newValue in
                        controller.saveName()
                    }

                Divider()
                    .background(ThemeEnum.primary)
                    .frame(width: 300)

                if controller.isSharingButton() == false{
                    Text("Insert at least 5 characters")
                        .foregroundColor(.red)
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(
                            width: UIScreen.main.bounds.width * 0.8
                        )
                }
            }
            if (controller.isSharingButton()) {

                NavigationLink(destination: RegisterPlantNameView()
                    .navigationBarHidden(false),
                               label: {
                    Text("Next")
                        .foregroundColor(ThemeEnum.primary)
                        .padding()
                        .frame(minWidth: 200, minHeight: 50)
                        .font(.title3)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(ThemeEnum.primary, lineWidth: 2))
                        .padding()
                        .cornerRadius(20)
                }
                ).offset(x: 0,y: 230)
            }
        }
        .background(ThemeEnum.secondary)
    }

    struct RegisterUserNameView_Preview : PreviewProvider {
        static var previews: some View {
            RegisterUserNameView()
        }
    }

    

}
