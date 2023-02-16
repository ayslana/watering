//
//  firstAccessView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI
import Foundation

struct WelcomeView: View {
    var body: some View {
        Home()
    }
}

struct WelcomeView_Preview : PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

    /*
    let notification = NotificationController()
    var body: some View {
        NavigationView {
            ZStack {
                ThemeEnum.firstview
                    .clipShape(LiquidSwipe(offset: offset))
                    .ignoresSafeArea()
                    .overlay(
                        Image(systemName: "chevron.left")
                            .font(.title.bold())
                            .foregroundColor(ThemeEnum.primary)
                            .frame(width: 2, height: 2)
                            .contentShape(Rectangle())
                            .gesture(onHoldGesture)
                            .offset(x: -CGFloat(Int(UIScreen.main.bounds.width/50)), y: CGFloat(Int(UIScreen.main.bounds.height/12)))
                            .foregroundColor(.white)
                            .opacity(offset == .zero ? 1 : 0)
                        ,alignment: .topTrailing
                    )
                    .gesture(onHoldGesture)
                    .padding(.trailing)
                if showHome {
                    RegisterUserNameView()
                        .simultaneousGesture(TapGesture().onEnded{
                        })
                }
                ZStack {
                    VStack {
                        Spacer().frame(height: 120)
                        apresetation
                        Spacer().frame(height: 100)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    var apresetation: some View {
        Text("Welcome to Watering! Before we start, we need to ask three questions.")
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .font(.system(size: 24, design: .rounded))
            .padding(.trailing)
            .offset(x: -15)
            .gesture(onHoldGesture)
            .offset(x: 15, y: -40)
            .foregroundColor(ThemeEnum.secondary)
            .opacity(offset == .zero ? 1 : 0)
    }
    var onHoldGesture: some Gesture {
        DragGesture().onChanged({ (value) in

            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                offset = value.translation
            }

        }).onEnded({(value) in
            let screen = UIScreen.main.bounds
            withAnimation(.spring()){
                if -offset.width > screen.width / 2 {
                    offset.width = -screen.height
                    showHome.toggle()
                } else {
                    offset = .zero
                }
            }
        })
    }*/

