//
//  ExteranlWebLinkview.swift
//  Africa
//
//  Created by Arjun Rana on 01/05/26.
//

import SwiftUI

struct ExteranlWebLinkview: View {
    let animal: Animal
    var body: some View {
        GroupBox{
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                   
                    Link(animal.name, destination: URL(string: animal.link)!)
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

