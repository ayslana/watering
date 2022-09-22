//
//  WaterWave.swift
//  Wattering plant
//
//  Created by Narely Lima on 14/09/22.
//

import Foundation
import SceneKit
import SwiftUI

struct WaterWave: Shape {

    var progress: CGFloat
    var waveHeight: CGFloat
    var offset: CGFloat

    var animatableData: CGFloat{
        get {offset}
        set {offset = newValue}
    }

//    var animatableData: AnimatablePair<CGFloat, CGFloat> {
//        get {
//            AnimatableData(offset, progress)
//        }
//        set {
//            offset = newValue.first
//            progress = newValue.second
//        }
//    }

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





