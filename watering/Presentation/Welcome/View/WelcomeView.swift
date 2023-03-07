//
//  firstAccessView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

//REPORT KEYNOTE TEMPLATE:
//REPORT KEYNOTE UPLOAD LINK ----- LUCAS: https://www.dropbox.com/request/R9Wz53zpqHlk0czkafKI
//REPORT AIRTABLE CBL ------ GABI: https://airtable.com/shrUgJaoUC3Ui37k4

import SwiftUI
import Foundation

struct WelcomeView: View {

    @State var offset: CGSize = .zero

    @State var showHome = false

    @State private var placeholder: String = ""

    var liquidSwipe: LiquidSwipe {
        get {
            return LiquidSwipe(offset: offset)
        }
    }

    var body: some View {

        ZStack {

            RegisterUserNameView().accessibilityHidden(true)

            Color("FirstView")
                .overlay() {
                    VStack (alignment: .leading, spacing: 20 ){

                        Text("string_args_0001")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color(.white))

                        Text("string_args_0005")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.white))

                    }
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.90)


                }


                .clipShape(liquidSwipe)
                .ignoresSafeArea()
            //Arrow
                .overlay(alignment: .topTrailing) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.accentColor)
                        .frame(width: 50, height: 100)
                        .ignoresSafeArea()
                        .gesture(DragGesture()

                            .onChanged({ (value) in

                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)) {
                                    offset = value.translation
                                }
                            })

                                .onEnded({ (value) in

                                    let screen = UIScreen.main.bounds

                                    withAnimation(.spring()){

                                        if -offset.width > screen.width / 2 {
                                            //removing view
                                            offset.width = -screen.height
                                            showHome.toggle()
                                        } else {
                                            offset = .zero
                                        }
                                    }
                                }))
                        .offset(
                            x: 15,
                            y: UIScreen.main.bounds.height < 800 ? liquidSwipe.mid * 0.45 : liquidSwipe.mid * 0.3
                        )
                    // Hidding arrow while draggin starts
                        .opacity(offset == .zero ? 1 : 0)

                        .accessibilityRepresentation {
                            Button("string_args_0006") {
                                let screen = UIScreen.main.bounds
                                offset.width = -screen.height
                                showHome.toggle()
                            }
                        }
                        .disabled(showHome)
                }
                .padding(.trailing)

            if showHome {
                RegisterUserNameView().simultaneousGesture(TapGesture().onEnded{})
            }
        }
        .background(ThemeEnum.secondary)
    }

}


struct WelcomeView_Preview : PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
