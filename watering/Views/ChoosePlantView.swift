//
//  ChoosePlantView.swift
//  watering
//
//  Created by Ayslana Riene on 21/09/22.
//

import SwiftUI
import SceneKit

struct ChoosePlantView: View {

    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var selected: DropWaterModel = PlantsType[0]
    @State var show = false
    @State var idPlant: Int = 0
    @State var typePlant: String = ""
    @State var modelNamePlant: String = ""
    @Namespace var namespace

    var body: some View {
    ZStack (alignment: .center){
        Theme.secondary.ignoresSafeArea()
            Spacer().frame(width: 30, height: 30)
            .padding([.leading,.top])
        VStack {
            cabeçalhoView
            choosePlantView
            if show {
                VStack{
                    scalePlantView
                    nextView
                }
            }
        }
    }
        .background(.white)
    }

    var cabeçalhoView: some View {
        Text("Escolha a sua plantinha")
        .multilineTextAlignment(.center)
        .foregroundColor(Theme.primary)
            .font(.system(size: 20, design: .rounded))
            .padding()
    }
    var choosePlantView: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: columns, spacing: 15){
                ForEach(PlantsType){ plant in
                    VStack (alignment: .center, spacing: 10){
                        PlantView(scene: {
                            let scene = SCNScene(named: plant.modelName)!
                            scene.background.contents = UIColor.clear
                            return scene
                        }(),
                            options: [.autoenablesDefaultLighting, .allowsCameraControl])
                        .frame(width: UIScreen.main.bounds.width/1.8, height: UIScreen.main.bounds.height / 3.5 , alignment: .center)
                        .cornerRadius(15)
                        .onTapGesture {
                            withAnimation(.spring()){
                                show.toggle()
                                selected = plant
                            }
                            }
                            .matchedGeometryEffect(id: plant.id, in: namespace)
                        Text(plant.type)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Theme.primary)
                            .font(.system(size: 15, design: .rounded))
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    var nextView: some View {
        VStack (alignment: .center){
            NavigationLink (
                destination : WateringView(idPlant: idPlant, typePlant: selected.type, modelNamePlant: selected.modelName).navigationBarHidden(true),
                    label : {
                        Text ("Próximo")
                            .foregroundColor(Theme.primary)
                            .frame(width: 200, height: 50)
                            .font(.system(size: 20, design: .rounded))
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                        .stroke(Theme.primary, lineWidth: 2))
                            .padding()
            })
            .navigationBarBackButtonHidden(true)
        }
    }
    var scalePlantView: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
            PlantView(scene: {
                let scene = SCNScene(named: selected.modelName)!
                scene.background.contents = UIColor.clear
                return scene
            }(),
                      options: [.autoenablesDefaultLighting, .allowsCameraControl])
            .frame(width: UIScreen.main.bounds.width/0.8, height: UIScreen.main.bounds.height / 1.4 , alignment: .center)
                .matchedGeometryEffect(id: selected.id, in: namespace)
            HStack {
                Button{
                    withAnimation(.spring()){
                        show.toggle()
                        self.idPlant = selected.id
                        self.typePlant = selected.type
                        self.modelNamePlant = selected.modelName
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 300, height: 490)
                        .foregroundColor(.white.opacity(0))
                }
            }
        }
    }
}

struct ChoosePlantView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePlantView()
    }
}