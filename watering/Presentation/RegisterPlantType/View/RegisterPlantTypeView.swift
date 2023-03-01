//
//  ChoosePlantView.swift
//  watering
//
//  Created by Ayslana Riene on 21/09/22.
//

import SwiftUI
import SceneKit

struct RegisterPlantTypeView: View {
    @State var isShowingOne = false
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    let components = PlantViewComponents()
    var controller = PlantViewController()

    var body: some View {
        VStack{
            titleView
            if isShowingOne {
                ScrollView(.vertical, showsIndicators: false){
                    bigPlantView
                    nextView
                }
            } else {
                choosePlantView
            }
        }.background(ThemeEnum.secondary)
    }
    
    var titleView: some View {
        Text("Choose your plant type")
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .font(.title3)
            .padding()
    }
    var choosePlantView: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 15){
                ForEach(PlantsType){ plant in
                    VStack (alignment: .center, spacing: 10){
                        components.plantViewConstructor(
                            plant: plant,
                            onTap: {
                                isShowingOne.toggle()
                                controller.selected = plant
                            }
                        )
                        Text(plant.type)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .font(.body)
                    }
                    .accessibilityRepresentation {
                         Button(plant.type) {
                             withAnimation(.easeOut){
                                 isShowingOne.toggle()
                                 controller.selected = plant
                             }
                         }
                     }
                }
            }
            .padding(.horizontal)
        }
    }

    var nextView: some View {

            NavigationLink (
                destination : WateringView().navigationBarHidden(true),
                label : {
                    Text ("Next")
                        .foregroundColor(.accentColor)
                        .frame(minWidth: 200, minHeight: 50)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("AccentColor"), lineWidth: 2))
                        .padding()
                })
            .simultaneousGesture(TapGesture().onEnded{
                controller.savePlantType()
            })
            .navigationBarBackButtonHidden(true)

    }
    var bigPlantView: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
            components.plantViewConstructor(
                plant: controller.selected,
                isBigPlant: true
            )
            Button {
                withAnimation(.spring()){
                    isShowingOne.toggle()
                }
            } label: {
                RoundedRectangle(cornerRadius: 30)
//                    .frame(minWidth: 300, minHeight: 200)
                    .foregroundColor(.clear)
            }
        }
    }
}

struct RegisterPlantTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlantTypeView()
    }
}
