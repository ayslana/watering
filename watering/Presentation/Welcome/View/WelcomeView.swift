//
//  firstAccessView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI
import Foundation

struct WelcomeView: View {

    @State var offset: CGSize = .zero

    @State var showHome = false

    var body: some View {
        ZStack {
            //Image("Welcome_BG")
            Color("Primary")
            //give content vefore Clipping
                .overlay(
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("For Academies")
                            .font(.largeTitle)
                            .fontWeight(.heavy)

                        Text("LOREM IPSUm, or lipsum as it is someties someti essometi essometi essomet iessome ties knowknow know know knowknowknowknow know know")
                            .font(.caption)
                            .fontWeight(.bold)
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal,30)
                    .offset(x: -15)
                )
                .clipShape(LiquidSwipe(offset: offset))
                .ignoresSafeArea()
                //Arrow
                .overlay(
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                        .frame(width: 50, height: 50)
                        .contentShape(Rectangle())
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
                        .offset(x: 15, y: 43)
                    // Hidding arrow while draggin starts
                        .opacity(offset == .zero ? 1 : 0)
                    ,alignment: .topTrailing
                )
                .padding(.trailing)

            if showHome {
                RegisterUserNameView().simultaneousGesture(TapGesture().onEnded{})
            }


        }
    }

}


struct WelcomeView_Preview : PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
