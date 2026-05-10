//
//  CoverImageView.swift
//  Africa
//
//  Created by Arjun Rana on 21/04/26.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    let coverimage: [CoverImage] = Bundle.main.decode("covers.json")
    //MARK: - BODY
    
    
    var body: some View {
        TabView {
            ForEach(coverimage){ item in
                
                Image(item.name).resizable().scaledToFill()
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

//MARK: - PREVIEW

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}
