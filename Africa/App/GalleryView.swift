//
//  GalleryView.swift
//  Africa
//
//  Created by Arjun Rana on 21/04/26.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal: String = "lion"
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    //Simple GRID DEFINITION
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    // EFFICENT GRID DEFINITION
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()) , count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            //MARK: - GRID
            VStack(alignment: .center, spacing: 30){
                
                //MARK: - BIG IMAGE
                Image(selectedAnimal).resizable().scaledToFit().clipShape(Circle())
                    .overlay(Circle().stroke(Color.white , lineWidth:  8 ))
                //MARK: - Slider
                Slider(value: $gridColumn , in: 2...4 , step: 1).padding().onChange(of: gridColumn, perform: {
                    value in gridSwitch()
                })
                // Grid
            LazyVGrid(columns: gridLayout, alignment: .center , spacing: 10){
                ForEach(animals) { item in
                    Image(item.image).resizable()
                        .scaledToFit().clipShape(Circle())
                        .overlay(Circle().stroke(Color.white))
                        .onTapGesture {
                            selectedAnimal = item.image
                            haptic.impactOccurred()
                        }
                }
            }.animation(.easeIn)
            .onAppear(perform: {
                gridSwitch()
           })
            }
            .padding(.horizontal , 10 )
            .padding(.vertical , 50 )
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity).background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
