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
            color: Color("Green")
        ),
        Intro(
            title: "Plan",
            subTitle: "your routes",
            description: "View your collection route Follow, change or add to your route yourself",
            pic: "Pic1",
            color: Color("Green")
        ),
        Intro(
            title: "Plan",
            subTitle: "your routes",
            description: "View your collection route Follow, change or add to your route yourself",
            pic: "Pic1",
            color: Color("Green")
        )
    ]

    var body: some View {
        ZStack {
            ForEach(intros.indices.reversed(),id: \.self){index in

                IntroView(intro: intros[index])

            }
        }
    }
    @ViewBuilder
    func IntroView(intro: Intro)->some View {

        ZStack {

            Color.green

            VStack {

                //Image(intro.pic)
                Image("welcomeview_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(40)
                    //.resizable()
                    //.scaledToFill()
                    //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    //.fixedSize()
                    //.aspectRatio(contentMode: .fit)
                    //.padding(40)

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
        }
        .ignoresSafeArea()
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
