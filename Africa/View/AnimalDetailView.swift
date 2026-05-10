//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Arjun Rana on 26/04/26.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical , showsIndicators: false){
            LazyVGrid(columns: [GridItem(.flexible())]) {
                VStack(alignment: .center, spacing: 20){
                    //Hero  Image
                    Image(animal.image).resizable().scaledToFit()
                    //TiTLE
                    Text(animal.name.uppercased()).font(.system(size: 40, weight: .heavy, design: . serif)).multilineTextAlignment(.center)
                        .padding(.vertical , 8)
                        .foregroundColor(.primary)
                        .shadow(color: .gray, radius: 4)
                        .background(
                            Color.accent
                                .frame(height: 6)
                                .offset(y: 24)
                        )
                    //HEADLINE
                    Text(animal.headline)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.accent)
                        .ignoresSafeArea()
                        .padding(.horizontal)
                    //GALLERY
                    Group{
                        HeadingView(headlingImage: "photo.on.rectangle.angled", headlingText: "Wildness in Picture")
                        InsetGalleryView(animal: animal).ignoresSafeArea()
                    }.padding(.horizontal)
                    
                    //FACTS
                    Group{
                        HeadingView(headlingImage: "questionmark.app", headlingText: "Facts")
                        FactsView(animal: animal)
                    }
                    //DESCRIPTION
                    
                    //MAP
                    Group{
                        HeadingView(headlingImage: "map", headlingText: "National Parks")
                        InsetMapView()
                    }
                    
                    //LINK
                    Group {
                        HeadingView(headlingImage: "books.vertical", headlingText: "Learn More")
                        ExteranlWebLinkview(animal: animal)
                    }
                }.navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)
            }
        }
    }
}

struct AnimalDetailView_Preview: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
      NavigationView{
          AnimalDetailView(animal: animals[1])
              .previewLayout(.sizeThatFits)
              .padding()
      }.previewDevice("iPhone 11 Pro")
  }
}
