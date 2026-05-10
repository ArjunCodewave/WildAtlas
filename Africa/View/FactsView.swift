//
//  FactsView.swift
//  Africa
//
//  Created by Arjun Rana on 01/05/26.
//

import SwiftUI

struct FactsView: View {
    let animal: Animal 
    var body: some View {
        TabView {
            ForEach(animal.fact, id: \.self) { item in
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 210).foregroundColor(Color("factsColourBackground"))
                    
                    Text(item)
                        .foregroundColor(.accentColor)
                        .font(.system(size: 12, weight: .heavy, design: .rounded))
                        .multilineTextAlignment(.center)
                        .shadow(color: .gray, radius: 3)
                        .shadow(radius: 4)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 220)
    }
}

struct FactsView_Preview: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    FactsView(animal: animals[1])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
