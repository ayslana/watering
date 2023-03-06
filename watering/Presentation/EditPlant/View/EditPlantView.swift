//
//  ChangePlantView.swift
//  Watering
//
//  Created by Narely Lima on 29/09/22.
//

import SwiftUI
import SceneKit

struct EditPlantView: View {
    @StateObject var controller = EditPlantController()
    @EnvironmentObject var userPlant: UserPlant
    @State private var showingAlert = false

    @Namespace var namespace
    @Environment(\.dismiss) var dismiss

    var columns = Array(
        repeating: GridItem(.flexible(), spacing: 15),
        count: 2
    )

    var body: some View {
        VStack {
            headerView
            choosePlantView
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if controller.isPlantSelected {
                    Button("Done") {
                        showingAlert = true
                    }.alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Choose plant"),
                            message: Text("Is this the plant you want?"),
                            primaryButton: .default(Text("Yes")) {
                                userPlant.savePlant(
                                    id: controller.selected.id,
                                    type: controller.selected.type,
                                    modelName: controller.selected.modelName
                                )
                                dismiss()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                } else {
                    Text("Done")
                        .foregroundColor(.secondary)
                }
            }
        }
        .background(ThemeEnum.secondary)
    }

    var headerView: some View {
        Text("Select your new plant type")
            .multilineTextAlignment(.center)
            .font(.title3)
            .lineLimit(nil)
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
            NavigationStack {
                PlantModalView().environmentObject(controller)
            }
        }

    }
}

//struct ChangePlantView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPlantView()
//    }
//}
