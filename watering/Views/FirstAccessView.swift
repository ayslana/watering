//
//  firstAccessView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import SwiftUI


struct FirstAccessView: View {
    @State var offset : CGSize = .zero
    @State var showHome = false
    let notification = NotificationController()
    var body: some View {
        NavigationView {
            ZStack {
                Theme.firstview
                    .clipShape(LiquidSwipe(offset: offset))
                    .ignoresSafeArea()
                    .overlay(
                        Image(systemName: "chevron.left")
                            .font(.title.bold())
                            .foregroundColor(Theme.primary)
                            .frame(width: 2, height: 2)
                            .contentShape(Rectangle())
                            .gesture(onHoldGesture)
                            .offset(x: 15, y: -40)
                            .foregroundColor(.white)
                            .opacity(offset == .zero ? 1 : 0)
                        ,alignment: .topTrailing
                    )
                    .gesture(onHoldGesture)
                    .padding(.trailing)
                if showHome {
                    RegisterPersonView()
                        .simultaneousGesture(TapGesture().onEnded{
                            notification.requestPermission()
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
            .foregroundColor(Theme.secondary)
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
    }
}

struct FirstAccessView_Preview : PreviewProvider {
    static var previews: some View {
        FirstAccessView()
    }
}

