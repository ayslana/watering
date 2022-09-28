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
                    
                        .gesture(DragGesture().onChanged({ (value) in
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
                        }))
                        .offset(x: 15, y: -40)
                        .foregroundColor(.white)
                        .opacity(offset == .zero ? 1 : 0)
                    
                    ,alignment: .topTrailing
                )                        .gesture(DragGesture().onChanged({ (value) in
                    
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
                }))
                .padding(.trailing)
                if showHome {
                    RegisterPersonView()
                }
                ZStack {
                    VStack {
                        Spacer().frame(height: 120)
                        Text("Antes de iniciarmos, precisamos de três informações.")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .font(.system(size: 30, design: .rounded))
                            .padding(.trailing)
                            .offset(x: -15)
                            .gesture(DragGesture().onChanged({ (value) in

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
                            }))
                            .offset(x: 15, y: -40)
                            .foregroundColor(Theme.secondary)
                            .opacity(offset == .zero ? 1 : 0)

                        Spacer().frame(height: 100)

                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }

}

struct FirstAccessView_Preview : PreviewProvider {
    static var previews: some View {
        FirstAccessView()
    }
}

struct LiquidSwipe: Shape {
    var offset : CGSize
    
    var animatableData: CGSize.AnimatableData {
        get{return offset.animatableData}
        set{offset.animatableData = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path{path in
            let width = rect.width + (-offset.width >  0 ? offset.width : 0)
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let from = 80 + (offset.width)
            
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))
            
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            let mid : CGFloat = 80 + ((to - 80) / 2)
  
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
            
        }
    }
}
