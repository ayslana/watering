//
//  ViewRouter.swift
//  Wattering plant
//
//  Created by Maria Letícia Dutra de Oliveira on 22/09/22.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: String
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "FirstVisitView"
        } else {
            currentPage = "PrincipalView"
        }
    }
}
