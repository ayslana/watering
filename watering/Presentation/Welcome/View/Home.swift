//
//  Home.swift
//  Watering
//
//  Created by Tales Valente on 14/02/23.
//
import SwiftUI
import Foundation

struct Home: View {

    @State var intros: [Intro] = [
        Intro(
            title: "Plan",
            subTitle: "your routes",
            description: "View your collection route Follow, change or add to your route yourself",
            pic: "Pic1",
            color: Color(.green)
        ),
        Intro(
            title: "Quick Waste",
            subTitle: "Transfer Note",
            description: "Record oil collections easily and accurately. No more paper!",
            pic: "Pic2",
            color: Color(.darkGray)
        ),
        Intro(
            title: "Invite",
            subTitle: "restaurants",
            description: "Know some restaurants who want to optimize oil collection? Invite them with one click",
            pic: "Pic3",
            color: Color(.yellow)
        )
    ]

    @GestureState var isDragging: Bool = false

    @State var fakeIndex: Int = 0
    
    @State var currentIndex: Int = 0


    var body: some View {
        ZStack {

            ForEach(intros.indices.reversed(),id: \.self){index in

                IntroView(intro: intros[index])
                    .clipShape(LiquidShape(offset: intros[index].offset, curvePoint: fakeIndex == index ? 50 : 0))
                    .padding(.trailing, fakeIndex == index ? 15 : 0)
                    .ignoresSafeArea()
            }

            //SKIP BUTTON CONFIGS AND RELATIVE POSITION BALLS
            HStack(spacing: 8) {

                ForEach(0..<intros.count - 2, id: \.self) {index in

                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                        .scaleEffect(currentIndex == index ? 1.15 : 0.85)
                        .opacity(currentIndex == index ? 1 : 0.25)

                }

                Spacer()

                Button {

                } label : {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }

            }
            .padding()
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .overlay(
            Button(action: {

            }, label: {

                Image(systemName: "chevron.left")
                    .font(.largeTitle)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .updating($isDragging, body: { value, out, _ in
                                out = true
                            })
                            .onChanged({ value in
                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){

                                    intros[fakeIndex].offset = value.translation
                                    print(intros[currentIndex].offset)
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.spring()) {

                                    if -intros[fakeIndex].offset.width > getRect().width / 2 {

                                        intros[fakeIndex].offset.width = -getRect().height * 1.5

                                        //Updating Index
                                        fakeIndex += 1

                                        //Updating Original index
                                        if (currentIndex == intros.count - 3) {
                                            currentIndex = 0
                                        } else {
                                            currentIndex += 1
                                        }


                                        //WHEN FAKE INDEX REACHES THE ELEMENT THAT IS BEFORE LAST ONE
                                        //SHIFTING AGAIN TO FIRST LAST SO THAT IT WILL CREATE A FEEL LIKE INFINITE CARROUSEL
                                        //TODO JUMP TO REGISTERNAMEVIEW
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                            if fakeIndex == (intros.count - 2) {

                                                for index in 0..<intros.count - 2 {
                                                    intros[index].offset = .zero
                                                }
                                                //Updating Current INdex
                                                fakeIndex = 0
                                            }
                                        }
                                    }
                                    else {
                                        intros[fakeIndex].offset = .zero
                                    }
                                }
                            })
                    )

            })
                .offset(y: 45)
                .opacity(isDragging ? 0 : 1)
                .animation(.linear, value: isDragging)

            ,alignment: .topTrailing
        )
        .onAppear {
            //INSERT LAST ELEMENT TO FIRST AND FIRST TO LAST

            guard let first = intros.first else {
                return
            }
            guard var last = intros.last else {
                return
            }

            last.offset.width = -getRect().height * 1.5

            intros.append(first)
            intros.insert(last, at: 0)

            fakeIndex = 1
        }
    }

    @ViewBuilder
    func IntroView(intro: Intro)->some View {

        VStack {

            Image(intro.pic)
            //Image("welcomeview_bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)


            VStack(alignment: .leading, spacing: 0) {

                Text(intro.title)
                    .font(.system(size: 45))

                Text(intro.subTitle)
                    .font(.system(size: 50, weight: .bold))

                Text(intro.description)
                    .font(.system(size:20))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .frame(width: getRect().width - 100)
                    .lineSpacing(8)

            }
            .foregroundColor(.white) //SHOULD BE WHITE W/ GREEN BG
            .frame(maxWidth: . infinity, alignment: .leading)
            .padding(.leading,20)
            .padding([.trailing,.top])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(

            intro.color
        )
    }

}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct LiquidShape: Shape {

    var offset: CGSize
    var curvePoint: CGFloat



    var animatableData: AnimatablePair<CGSize.AnimatableData, CGFloat>{
        get {
            return AnimatablePair(offset.animatableData,curvePoint)
        }
        set {
            offset.animatableData = newValue.first
            curvePoint = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {

        return Path{path in

            let width = rect.width + (-offset.width > 0 ? offset.width: 0)

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            let from = 80 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80: from))

            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to

            let mid : CGFloat = 80 + ((to - 80)/2)

            path.addCurve(to: CGPoint(x: rect.width, y: to),
                          control1: CGPoint(x: width - curvePoint, y: mid),
                          control2: CGPoint(x: width - curvePoint, y: mid))
        }

    }
}
