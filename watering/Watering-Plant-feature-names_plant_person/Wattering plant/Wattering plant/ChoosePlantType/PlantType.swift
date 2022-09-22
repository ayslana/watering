//
//  PlantType.swift
//  Wattering plant
//
//  Created by Maria Letícia Dutra de Oliveira on 13/09/22.
//
 
import SwiftUI
 
struct PlantType: View {
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    @State var selected : Plants = PlantsType[0]
    @State var show = false
    @Namespace var namespace
    
    
    var body: some View {
        
    ZStack (alignment: .top){
        
        Theme.secondary.ignoresSafeArea()
            
            Spacer().frame(width: 30, height: 30)
            
            .padding([.leading,.top])
            
        VStack {
            
            Text("Escolha a sua plantinha")
            .multilineTextAlignment(.center)
            .foregroundColor(Theme.primary)
                .font(.system(size: 20, design: .rounded))
                .padding()
            
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVGrid(columns: columns, spacing: 15){
                    
                    ForEach(PlantsType){ plant in
                        
                        VStack (alignment: .center, spacing: 10){
                            
                            Image(plant.image)
                                .resizable()
                                .frame(height: 180)
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
            
            if show {
                
                VStack{
     
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                            
                        Image(selected.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .matchedGeometryEffect(id: selected.id, in: namespace)
                        
                        HStack {
                            
                            Button{
                                
                                withAnimation(.spring()){
                                    
                                    show.toggle()
                                    
                                }
                                
                            } label: {
                            
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 300, height: 490)
                                    .foregroundColor(.white.opacity(0))
                            
                            }
                            
                        }
     
                    }
                    
                    VStack (alignment: .center){
                        
                        NavigationLink (
                            
                            destination : PrincipalView().navigationBarHidden(true),
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
            }
            

        }
    }
        .background(.white)
        
    }
    
}
 
struct PlantType_Previews: PreviewProvider {
    static var previews: some View {
        PlantType()
    }
}
 
struct Plants : Identifiable {
    
    var id: Int
    var type: String
    var image: String
    
}
 
var PlantsType = [
    
Plants(id: 0, type: "Flor", image: "flower"),
Plants(id: 1, type: "Suculenta", image: "plant"),
Plants(id: 2, type: "Frutífera", image: "fruit"),
Plants(id: 3, type: "Cacto", image: "cactus")
 
]
 


