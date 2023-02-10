//
//  registerPersonView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SwiftUI


struct RegisterUserNameView: View {
    @State var personName: String = ""

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
                        .font(.system(size: 22, design: .rounded))
                        .fixedSize()

                    TextField("Type Here", text: $personName)
                        .fixedSize()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .font(.system(size: 20, design: .rounded))
                        .padding()
                        .onChange(of: personName) { newValue in
                            saveName()
                        }



                } //EOV
                //.frame(width: 400, height:500)
                //.background(Color.red)

                ZStack {
                    if (!personName.isEmpty && personName.count >= 5) {

                        Divider()
                            .background(ThemeEnum.primary)
                            .frame(width: 300)
                            .padding(.bottom, 50)


                        Spacer()
                            .frame(height: 50)

                        NavigationLink(destination: RegisterPlantNameView()
                            .navigationBarHidden(true),
                               label: {
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
                        .padding(.top, 50)
                    }

                }
                .padding(.top, 200)
            }//EOZ
            .background(Color(UIColor.systemBackground))
            .navigationBarBackButtonHidden(true)

        }

    }

    func saveName() {
        UserDefaults.standard.setPersonName(value: personName)
        //notification.requestPermission()
    }

    struct RegisterUserNameView_Preview : PreviewProvider {
        static var previews: some View {
            RegisterUserNameView()
        }
    }


}
