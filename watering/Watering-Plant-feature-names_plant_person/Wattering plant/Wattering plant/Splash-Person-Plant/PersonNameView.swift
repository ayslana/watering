//
//  PersonNameView.swift
//  Wattering plant
//
//  Created by Narely Lima on 12/09/22.
//

import Foundation
import SwiftUI

enum Theme {
    static let primary = Color("Primary")
    static let secondary = Color("Secondary")
    static let water = Color("Water")
    static let font = Color("Font")
    static let firstview = Color("FirstView")
    static let firstfont = Color("FirstFont")
}

struct PersonNameView: View {
    
    var body: some View {
        
        Theme.secondary.ignoresSafeArea()
        
        NavigationView {
            
            ZStack (alignment: .top){
                Theme.secondary.ignoresSafeArea()
                
                NameUser()
                
            }

        }.navigationBarBackButtonHidden(true)
    }
}

struct NameUser : View {
    
    @State var textFieldPerson: String = ""

    
    var body: some View {
    
    VStack {
        
        Text("Qual o seu nome?")
            .foregroundColor(Theme.primary)
            .font(.system(size: 20, design: .rounded))

        TextField(" ", text: $textFieldPerson)
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .font(.system(size: 15, design: .rounded))
            .padding()

        
        Divider()
            
            .background(Theme.primary)
            .frame(width: 300)
            
        
        
        Spacer().frame(height: 100)

        NavigationLink(destination: PlantNameView().navigationBarHidden(true), label: {
            Text("Próximo")
                .foregroundColor(Theme.primary)
                .padding()
                .frame(width: 200, height: 50)
                .font(.system(size: 20, design: .rounded))
                .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Theme.primary, lineWidth: 2))
                
                .padding()
                .cornerRadius(20)
            }
        )
        
        Spacer().frame(height: 146)
        
        }
    }
    
}

struct PersonNameView_Preview : PreviewProvider {
    static var previews: some View {
        PersonNameView()
    }
}


