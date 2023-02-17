//
//  WelcomeController.swift
//  Watering
//
//  Created by Tales Valente on 17/02/23.
//

import Foundation
import SwiftUI


struct LiquidSwipe: Shape {

    var offset: CGSize

    //Animating Path
    var animatableData: CGSize.AnimatableData {
        get {
            return offset.animatableData
        }
        set {
            offset.animatableData = newValue
        }
    }

    func path(in rect: CGRect) -> Path {

        return Path{path in

            let width = rect.width + (-offset.width > 0 ? offset.width: 0)

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            //From
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))

            //Adding height
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to

            //Mid between 80 - 180
            let mid : CGFloat = 80 + ((to - 80) / 2)




            path.addCurve(to: CGPoint(x: rect.width, y: to),
                          control1: CGPoint(x: width - 50, y: mid),
                          control2: CGPoint(x: width - 50, y: mid))

        }
    }

}
