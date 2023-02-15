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
        VStack {
            titleView
            choosePlantView
            if isShowingOne {
                VStack{
                    bigPlantView
                    nextView
                }
            }
        }.background(ThemeEnum.secondary)
    }
    
    var titleView: some View {
        Text("Choose your plant type")
            .multilineTextAlignment(.center)
            .foregroundColor(ThemeEnum.primary)
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
                            .foregroundColor(ThemeEnum.primary)
                            .font(.body)
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    var nextView: some View {
        VStack (alignment: .center){
            NavigationLink (
                destination : WateringView().navigationBarHidden(true),
                label : {
                    Text ("Next")
                        .foregroundColor(ThemeEnum.primary)
                        .frame(width: 200, height: 50)
                        .font(.system(size: 20, design: .rounded))
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(ThemeEnum.primary, lineWidth: 2))
                        .padding()
                })
            .simultaneousGesture(TapGesture().onEnded{
                controller.savePlantType()
            })
            .navigationBarBackButtonHidden(true)
        }
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
                    .frame(width: 300, height: 490)
                    .foregroundColor(.white.opacity(0))
            }
        }
    }
}

struct RegisterPlantTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlantTypeView()
    }
}
