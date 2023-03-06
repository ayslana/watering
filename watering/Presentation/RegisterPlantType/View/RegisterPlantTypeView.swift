//
//  ChoosePlantView.swift
//  watering
//
//  Created by Ayslana Riene on 21/09/22.
//

import SwiftUI
import SceneKit

struct RegisterPlantTypeView: View {
    @StateObject var controller = EditPlantController()
    @State private var showingAlert = false
    @Namespace var namespace

    let columns = Array(
        repeating: GridItem(.flexible(), spacing: 15),
        count: 2
    )

    var body: some View {
        VStack{
            titleView
            choosePlantView
            nextView
        }.background(ThemeEnum.secondary)
            .navigationBarBackButtonHidden(false)
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
                    if (plant.id == controller.selected.id) && controller.isPlantSelected {
                        buildGridElement(plant: plant)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("AccentColor"), lineWidth: 2))
                    } else {
                        buildGridElement(plant: plant)
                    }
                    .accessibilityRepresentation {
                        Button(plant.type) {
                            withAnimation(.easeOut){
                                show.toggle()
                                selected = plant
                            }
                        }
                        .accessibilityLabel(plant.accessibilityDescription)
                    }

                }
            }
            .padding(.horizontal)
        }
    }

    func buildGridElement(plant: DropWaterModel) -> some View {
        return VStack (alignment: .center, spacing: 10){
            plantForChooseView(plant: plant)
            Text(plant.type)
                .multilineTextAlignment(.center)
                .font(.body)
                .lineLimit(nil)
                .foregroundColor(ThemeEnum.font)
        }
    }

    func plantForChooseView(plant: DropWaterModel) -> some View {
        return VStack{
            Button(
                action:  {
                    controller.isShowingPlant = true
                    controller.isPlantSelected = true
                    controller.selected = plant
                    controller.savePlantType()
                }, label: {
                    PlantViewRepresentable(scene: {
                        let scene = SCNScene(named: plant.modelName)!
                        scene.background.contents = UIColor.clear
                        return scene
                    }(),
                                           options: [.autoenablesDefaultLighting])
                    .frame(
                        minWidth: UIScreen.main.bounds.width/1.8,
                        minHeight: UIScreen.main.bounds.height / 3.5 ,
                        alignment: .center
                    )
                    .matchedGeometryEffect(id: plant.id, in: namespace)
                })
        }.sheet(isPresented: $controller.isShowingPlant){
            PlantModalView().environmentObject(controller)
        }

    }

    var nextView: some View {

            NavigationLink (
                destination : WateringView().navigationBarHidden(true),
                label : {
                    Text ("Done")
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
}

struct RegisterPlantTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlantTypeView()
    }
}
