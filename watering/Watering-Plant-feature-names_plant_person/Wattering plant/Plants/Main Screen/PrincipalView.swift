//
//  PrincipalView.swift
//  Wattering plant
//
//  Created by Narely Lima on 14/09/22.
//

import Foundation
import SwiftUI
import SceneKit
import UIKit
import AVFoundation
import SpriteKit



struct PrincipalView: View {
    @State var modelo = Model(id: 0, modelName: "Lowpoly_tree_sample.dae")
    @State var progress: CGFloat = 0.1
    @State var startAnimation: CGFloat = 0
    @State var isComplete: Bool = false
//    @State var isSucess: Bool = false
    @State var isPressed: Bool = false
    @State var audioPlayer: AVAudioPlayer?
    let graycolor = Color(red: 48/255, green: 48/255, blue: 48/255)
    let bluewater = Color(red: 97/255, green: 165/255, blue: 194/255)
    let darkgreen = Color(red: 77/255, green: 93/255, blue: 83/255)
    let bluesky = Color(red: 169/255, green: 214/255, blue: 229/255)
    let lightgreen = Color(red: 143/255, green: 151/255, blue: 121/255)

    var rainLightningScene: SKScene {
        let scene = RainLightningScene.shared
        scene.size = UIScreen.screenSize
        scene.scaleMode = .fill
        return scene
    }
    //    var items = [InfoUser]()

    let timer = Timer.publish(every: 0.003, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack(alignment: .bottom) {
//            LinearGradient(colors: [bluesky, .white], startPoint: .topLeading, endPoint: .center)
//                .opacity(0.5)
//            .ignoresSafeArea()
            
            Theme.secondary.ignoresSafeArea()
            
            
            VStack {
                Group {
                  Text("Bom dia, User!") +
                    Text(" Plantinha").foregroundColor(Theme.primary) +
                  Text(" está sem receber água há dois dias.")
                }
                    .multilineTextAlignment(.center)
                    .foregroundColor(Theme.font)
                    .padding()
                    .font(.system(size: 20, design: .rounded))
                
                Spacer().frame(height: 40)
                
                LegacySceneView(scene: {
                    let scene = SCNScene(named: modelo.modelName)!
                    scene.background.contents = UIColor.clear
                    return scene
                }(),
                options: [.autoenablesDefaultLighting])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2, alignment: .center)
                Spacer().frame(height: 120)
            }
            
            if !isComplete {
                GeometryReader{ proxy in
                    let size = proxy.size

                    WaterWave(progress: progress, waveHeight: 0.025, offset: startAnimation)
                        .fill(Theme.water)
                        .opacity(0.5)
                        .ignoresSafeArea()
                        .frame(width: size.width, height: size.height, alignment: .center)
                        .onAppear{
                            withAnimation(.linear(duration: 9).repeatForever(autoreverses: false)){
                                startAnimation = size.width
                            }
                        }
                }
            Image(systemName: "drop")
                .font(.system(size: 30))
                .foregroundColor(Theme.font)
                .padding(25)
                .overlay(
                    Circle()
                        .stroke(Theme.font, lineWidth: 2))
//                    .strokeBorder(graycolor, lineWidth: 2)
//                    .background(Circle().fill(.white))
//                        )
                .gesture(onHoldGesture)

            if isComplete {
                SpriteView(scene: rainLightningScene, options: [.allowsTransparency])
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                        .ignoresSafeArea()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
//        .onAppear {
////            let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "WaterSound", ofType: "mp3")!)
//
//            do{
//                audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)
//
//            }catch {
//                print("there was some error. The error was \(error)")
//            }
//        }
        .onReceive(timer) { _ in
            if isPressed {
                withAnimation(Animation.easeInOut(duration: 2)) {
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
}




struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalView()
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
