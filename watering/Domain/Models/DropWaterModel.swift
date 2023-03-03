//
//  DropWaterModel.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation

// É a struct que contem o modelo para conseguir categorizar nossos modelos 3D
// Por ser parecido com um dicionario, nós conseguimos trabalhar com os itens
// de mais simplificada
struct DropWaterModel : Identifiable {
    var id: Int
    var type: String
    var modelName: String
    var accessibilityDescription: String
//    var timeWatering: Int
}

var PlantsType = [
    DropWaterModel(id: 0, type: "Flower", modelName: "flower.scn", accessibilityDescription: "Representation of two buttercups containing green petals, joined by a green branch"),
    DropWaterModel(id: 1, type: "Succulent", modelName: "succullent.scn", accessibilityDescription: "Succulent, originally from Mexico that grows in the shape of a small rose, reaching up to 12.5 cm in diameter, contains long leaves in grayish-green color, and if they receive a lot of light they can become reddish and even slightly purple"),
    DropWaterModel(id: 2, type: "Sapling", modelName: "plants.scn", accessibilityDescription: "Tree Seedling similar to a branch of eucalyptus, which has small leaves that are more rounded and completely green"),
    DropWaterModel(id: 3, type: "Cactus", modelName: "cactus.scn", accessibilityDescription: "Small-sized oval cactus, fully green and flowerless, with pointed ends")
]
    
