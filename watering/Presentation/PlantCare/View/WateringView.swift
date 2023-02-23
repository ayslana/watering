//
//  WateringView.swift
//  watering
//
//  Created by Ayslana Riene on 20/09/22.
//

import Foundation
import SwiftUI
import SceneKit
import AVFoundation
import SpriteKit


struct WateringView: View {
    
    @State var progress: CGFloat = 0.1
    @State var startAnimation: CGFloat = 0
    @State var isComplete: Bool = false
    @State var isSucess: Bool = false
    @State var isPressed: Bool = false
    @State var audioPlayer: AVAudioPlayer?
    @State var audioPlayer2: AVAudioPlayer?
    @State var dayWatering = ""
    @State var valueAnimation: Bool = false

    @EnvironmentObject var userPlant: UserPlant
    
    var rainLightningScene: SKScene {
        let scene = RainSceneView()
        scene.size = UIScreen.screenSize
        scene.scaleMode = .fill
        return scene
    }
    //    var items = [InfoUser]()
    let timer = Timer.publish(every: 0.003, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ThemeEnum.secondary.ignoresSafeArea()
                ZStack{
                    information
                    .offset(y: -UIScreen.main.bounds.height/2.4)
                    .padding(5)
                    VStack {
                        treeView
                    } .offset(y: -UIScreen.main.bounds.height/6)
                }
                if !isComplete {
                    waterWaveView
                }
                button
                    .padding()
                if isComplete {
                    animationRainView(nil, value: true)
                    if isSucess {
                        animationRainView(nil, value: true)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                //MUSICA DA AGUA SUBINDO
                let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "WaterSound", ofType: "mp3")!)
                do{
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)
                }catch {
                    print("there was some error. The error was \(error)")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: EditNameView().environmentObject(userPlant),
                        label: {
                            Text("Edit").foregroundColor(ThemeEnum.primary)
                        }
                    )
                }
            }
            .onReceive(timer) { _ in
                if isPressed {
                    withAnimation(Animation.easeInOut(duration: 1)) {
                        if progress >= 0.5 {
                            isComplete = true
                            isPressed = false
                            audioPlayer?.stop()
                        } else {
                            progress += 0.0003
                            isComplete = false
                        }
                    }
                }
            }
        }
        .accentColor(ThemeEnum.primary)
//        .navigationBarBackButtonHidden()
    }
    var information: some View {
        VStack {
            Group {
                Text("Hello, ").foregroundColor(ThemeEnum.font) +
                Text("\(UserDefaults.standard.getPersonName() ?? "Unset").").foregroundColor(ThemeEnum.primary)
                Text(" \(UserDefaults.standard.getPlantName() ?? "Unset" ) ").foregroundColor(ThemeEnum.primary) +
                Text("has not received water since: ").foregroundColor(ThemeEnum.primary)
                Text("\(UserDefaults.standard.getLastDate() ?? "long time")" ).foregroundColor(ThemeEnum.primary)
            }
            .multilineTextAlignment(.center)
            .foregroundColor(ThemeEnum.font)
            .font(.system(size: 20, design: .rounded))
        }

    }

    var treeView: some View {
        //INSERÇÃO DO MODELO 3D
        PlantViewRepresentable(scene: {
            let modelo = DropWaterModel(id: UserDefaults.standard.getPlantID() ?? 0, type: UserDefaults.standard.getPlantTypeName() ?? "", modelName: UserDefaults.standard.getPlantType() ?? "")
            let scene = SCNScene(named: modelo.modelName)!
            scene.background.contents = UIColor.clear
            return scene
        }(),
                  options: [.autoenablesDefaultLighting, .allowsCameraControl])
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.4 , alignment: .center)
    }
    
    var waterWaveView: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            //FUNCAO QUE PERMITE QUE A ONDA SUBA NA TELA
            WaterWaveView(progress: progress, waveHeight: 0.025, offset: startAnimation)
                .fill(ThemeEnum.water)
                .opacity(0.3)
                .ignoresSafeArea()
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear{
                    withAnimation(.linear(duration: 9).repeatForever(autoreverses: false)){
                        startAnimation = size.width
                    }
                }
        }
    }
    var onHoldGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged ({ _ in
                // HABILITAR INCREMENTO
                isPressed = true
                audioPlayer?.play()
                // iniciar o timer
            })
            .onEnded ({ _ in
                // DESABILITAR INCREMENTO
                isPressed = false
                audioPlayer?.pause()
                // parar o timer
            })
    }
    var button: some View {
        Image(systemName: "drop")
            .font(.system(size: 30))
            .foregroundColor(ThemeEnum.primary)
            .padding(25)
            .background(ThemeEnum.secondary)
            .cornerRadius(50)
            .gesture(onHoldGesture)
    }

    func animationRainView <valueAnimation>(_ animation: Animation?, value: valueAnimation) -> some View where valueAnimation : Equatable {
        SpriteView(scene: rainLightningScene, options: [.allowsTransparency])
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
            .ignoresSafeArea()
            .onAppear {
                //SOM DO DONE
                let soundURL2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "DoneSound", ofType: "mp3")!)
                do{
                    audioPlayer2 = try AVAudioPlayer(contentsOf: soundURL2 as URL)
                    audioPlayer2?.play()
                }catch {
                    print("there was some error. The error was \(error)")
                }
            }
            .onAppear{
                //DEFINE O TEMPO DE PERMANENCIA DAS GOTINHAS
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.startAnimation = 0
                    self.isSucess = true
                    self.isComplete = false
                    self.progress = 0.1
                    self.dayWatering = "\(Date.now.formatted(.dateTime.weekday(.wide).hour().minute().second()))"
                    saveLastDate()

                }
            }
            .onDisappear() {
                self.isSucess = false
            }
    }
    func saveLastDate() {
        UserDefaults.standard.setLastDate(value: dayWatering)
    }
    
}

struct WateringView_Previews: PreviewProvider {
    static var previews: some View {
        WateringView()
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

