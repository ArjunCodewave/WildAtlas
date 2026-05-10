//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Arjun Rana on 07/05/26.
//

import SwiftUI

struct MapAnnotationView: View {
    var location : NationalParkLocation = Bundle.main.decode("location.json")
    @State private var  animation: Double = 0.0
    var body: some View {
        ZStack{
            Circle().fill(Color.accent).frame(width: 54 , height: 54 , alignment: .center)
            Circle().stroke(Color.accent , lineWidth: 2)
                .frame(width: 52 , height: 52 , alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image).resizable().scaledToFit().frame(width: 48 , height: 48 , alignment: .center).clipShape(Circle())
        }.onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}


