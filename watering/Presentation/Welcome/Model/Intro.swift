//
//  Intro.swift
//  Watering
//
//  Created by Tales Valente on 14/02/23.
//

import Foundation
import SwiftUI

// Intro Model and Sample Screen

struct Intro: Identifiable{
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var pic: String
    var color: Color
    var offset: CGSize = .zero

}
