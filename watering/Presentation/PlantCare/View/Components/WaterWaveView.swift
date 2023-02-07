//
//  WaterWaveView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SceneKit
import SwiftUI

//struct que controla a onda
//progress: avanço que a onda da por minuto
//waveHeight: amplitude inicial da onda
//Path: serve para desenhar formas personalizadas, no caso, nossa ondinha
//https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui
struct WaterWaveView: Shape {
    var progress: CGFloat
    var waveHeight: CGFloat
    var offset: CGFloat
    var animatableData: CGFloat{
        get {offset}
        set {offset = newValue}
    }
    //Funcao responsavel por personalizar uma visualizacao retangular(CGRect)
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: .zero)
            let progressHeight: CGFloat = (1 - progress) * rect.height
            
            let height = (waveHeight * rect.height)
            for value in stride(from: 0, to: rect.width, by: 2){
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                path.addLine(to: CGPoint(x: x, y: y))
            }
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
    
}
