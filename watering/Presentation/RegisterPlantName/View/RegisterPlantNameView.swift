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
            ZStack {
                //ThemeEnum.secondary.ignoresSafeArea()
                ThemeEnum.flower
                    .resizable()
                    .alignmentGuide(.trailing) { dimension in
                        dimension[.trailing] - 70
                    }
                    .frame(alignment: .trailing)
                VStack {
                    Spacer().frame(height: 50)
                    Text("What is the name of your plant?")
                        .foregroundColor(ThemeEnum.font)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .font(.title2)
                        .frame(
                            width: UIScreen.main.bounds.width * 0.9
                        )
                    TextField("Type Here", text: $controller.plantName)
                        .foregroundColor(ThemeEnum.font)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .frame(
                            width: UIScreen.main.bounds.width * 0.8
                        )
                        .onChange(of: controller.plantName) { newValue in
                            controller.savePlantName()
                        }

                    Divider()
                        .background(ThemeEnum.primary)
                        .frame(width: 300)

                    if controller.isSharingButton() == false{
                        Text("Enter at least 4 characters")
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

                    NavigationLink(destination: RegisterPlantTypeView().navigationBarHidden(false), label: {
                        Text("Next")
                            .foregroundColor(.accentColor)
                            .padding()
                            .frame(minWidth: 200, minHeight: 50)
                            .font(.title3)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("AccentColor"), lineWidth: 2))
                            .padding()
                            .cornerRadius(20)
                    }
                    ).offset(x: 0,y: 230)
                }

            }

        .background(ThemeEnum.secondary)
    }
}
struct RegisterPlantNameView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlantNameView()
    }
}
