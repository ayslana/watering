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

    var mid: CGFloat {
//        var mid: CGFloat
//        var to = 180 + (offset.height) + (-offset.width)
//        to = to < 180 ? 180 : to
//        mid = 80 + ((to - 80) / 2)
//        return mid

        var mid: CGFloat

        var from = 80 + (offset.width)
        from = from > 80 ? 80 : from

        var to = 180 + (offset.height) + (-offset.width)
        to = to < 180 ? 180 : to

        mid = (from+to)/2
        return mid

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


            path.addCurve(
                to: CGPoint(x: rect.width, y: to),
                control1: CGPoint(x: width - 50, y: mid),
                control2: CGPoint(x: width - 50, y: mid))

        }
    }
}
