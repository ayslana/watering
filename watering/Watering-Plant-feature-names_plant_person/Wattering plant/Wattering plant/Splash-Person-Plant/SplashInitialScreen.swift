//
//  ViewController.swift
//  Wattering plant
//
//  Created by Maria Letícia Dutra de Oliveira on 06/09/22.
//

import SwiftUI
import UIKit

struct SplashInitialScreen: View {
    @State private var isActive = false
    @State private var size = 0.05
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            FirstVisitView()
//                .transition(.move(edge: .trailing))
//                .animation(.easeIn(duration: 1.0))
        }
        else {
            ZStack{
                //Color(red: 223/255, green: 255/255, blue: 214/255).ignoresSafeArea()
                VStack {
                    VStack {
                        Image("iconSplash")
                        Text("Watering Plant")
                            .font(.system(size: 80, design: .serif))
                            .fontWeight(.semibold)
                            .frame(width: 700)
                            .foregroundColor(Color(red: 9/255, green: 82/255, blue: 86/255))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.3)) {
                        self.size = 0.30
                        self.opacity = 1.0
                        }
                    }
                }
                .opacity(isActive ? 0: 1)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                self.isActive = true
                        }
                    }
                }
            }
    }
}


struct SplashInitialScreen_Previews : PreviewProvider {
    static var previews: some View {
        SplashInitialScreen()
    }
}
