//
//  HeadingView.swift
//  Africa
//
//  Created by Arjun Rana on 26/04/26.
//

import SwiftUI

struct HeadingView: View {

    //MARK: - PROPERTIES
    var headlingImage: String
    var headlingText: String
    //MARK: - BODY
    
    

    var body: some View {
        HStack{
            Image(systemName: headlingImage).foregroundColor(.accent).imageScale(.large)
            Text(headlingText).font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeadingView(headlingImage: "photo.on.rectangle.angled", headlingText: "Wilderness in Pictures").padding()
}
