//
//  ContentView.swift
//  Africa
//
//  Created by Arjun Rana on 21/04/26.
//

import SwiftUI

struct ContentView: View {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive : Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let gridlayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                List{
                    CoverImageView().frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    ForEach(animals){ animals in
                        NavigationLink( destination: AnimalDetailView(animal: animals)){
                            AnimalListItemView(animal: animals)
                        }
                        
                    }
                    }
                } else {
                    ScrollView(.vertical , showsIndicators: false){
                        LazyVGrid(columns: gridlayout, alignment: .center, spacing: 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalGridItemView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }.padding(10)
                        .animation(.easeIn)
                    }
                }
            }.navigationTitle("Animals")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        HStack(spacing: 16){
                            // LIST
                            Button(action: {
                                print("List is Activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }) {
                                Image(systemName: "square.fill.text.grid.1x2").font(.title2).foregroundColor(isGridViewActive ? .primary : .accent)
                                    
                            }
                            
                            
                            Button(action: {
                                print("Grid view is activated")
                                isGridViewActive = true
                                haptics.impactOccurred()
                            }){
                                Image(systemName: "square.grid.2x2").font(.title2).foregroundColor(isGridViewActive ? .accentColor : .primary)
                            }
                        
                        }
                    }
                }
        }
    
    }
}

#Preview {
    ContentView()
}
