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
            
            Image("Flower")
                .resizable()
                .alignmentGuide(.trailing) { dimension in
                    dimension[.trailing] - 70
                }
                .frame(alignment: .trailing)
            
            //MARK: JUST A FAKEHOLDER TO SIMULATES THE SECOND SCREEN
            VStack {
                Spacer().frame(height: 50)


                Text(LocalizedStringKey("label1"))
                    .foregroundColor(ThemeEnum.font)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .font(.title2)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.9
                    )
                
                TextField(LocalizedStringKey("label2"), text: $placeholder)
                    .multilineTextAlignment(.center)
                    .foregroundColor(ThemeEnum.font)
                    .font(.body)
                    .frame(
                        width: UIScreen.main.bounds.width * 0.8
                    )
                
                Divider()
                    .background(ThemeEnum.primary)
                    .frame(width: 300)
                
                if (true){
                    Text(LocalizedStringKey("label3"))
                        .foregroundColor(.red)
                        .font(.caption2)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(
                            width: UIScreen.main.bounds.width * 0.8
                        )
                }
            }
            //MARK: END OF THE FAKEHOLDER
            
            Color("FirstView")
            //Color(.systemMint)
            //Color(.systemIndigo)
                .overlay() {
                    VStack (alignment: .leading, spacing: 20 ){
                        
                        Text(LocalizedStringKey("label4"))
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color(.white))
                        
                        
                        Text(LocalizedStringKey("label5"))
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
                    //.foregroundColor(Color.brown)
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
                            Button(LocalizedStringKey("label6")) {
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




// MARK: -- FUNCIONAL OVERLAY WITH CUSTOM BACKGROUND
////Image("Welcome_BG")
//.resizable()
//                .overlay() {
//                    Rectangle()
//                        .fill(Color.white.opacity(0.90))
//                        .frame(width: 500, height: 170)
//                        .ignoresSafeArea()
//                        .blur(radius: 10)
//
//                    Text("Welcome to Watering!")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .padding(70)
//                        .offset(x: -70, y: -15)
//                        .foregroundColor(Color(.systemTeal))
//                    Text("Before we start, we need to ask three questions...")
//                        .font(.caption)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color(.systemTeal))
//                        .offset(x: -20, y: 45)
//
//                }
//
//
//                .overlay() {
//                    Rectangle()
//                        .frame(width: 340, height: 170)
//                        .blur(radius: 10)
//                        .foregroundColor(.white)
//                    Text("Welcome to Watering!")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .padding(10)
//                        .offset(x: -50, y: -15)
//                        .foregroundColor(Color(.systemTeal))
//                    Text("Before we start, we need to ask three questions...")
//                        .font(.caption)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color(.systemTeal))
//                        .offset(x: 0, y: 40)
//
//                }

//                .overlay() {
//                    Rectangle()
//                        .frame(width: 500, height: 170)
//                        .ignoresSafeArea()
//                        .blur(radius: 10)
//                        .foregroundColor(.white)
//                    Text("Welcome to Watering!")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .padding(70)
//                        .offset(x: -70, y: -15)
//                        .foregroundColor(Color(.systemTeal))
//                    Text("Before we start, we need to ask three questions...")
//                        .font(.caption)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color(.systemTeal))
//                        .offset(x: -20, y: 45)
//
//                }



//give content vefore Clipping
//                .overlay(
//                    VStack(alignment: .leading, spacing: 10, content: {
//
//                        Rectangle()
//                            .frame(width: 300, height: 200, alignment: .leading)
//                            .foregroundColor(.white)
//                            .blur(radius: 10)
//                            .ignoresSafeArea()
//
//                            //.overlay() {
//                                Text("Welcome to Watering!")
//                                    .font(.largeTitle)
//                                    .fontWeight(.heavy)
//                                    .foregroundColor(Color(.systemTeal))
//                                    .padding(20)
//
//                                Text("Before we start, we need to ask three questions...")
//                                    .font(.caption)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(Color(.systemTeal))
//                                    .padding(20)
//                            //}
//
//
//                    })
////                    .foregroundColor(.white)
////                    .padding(.horizontal,30)
////                    .offset(x: -15)
//                )
