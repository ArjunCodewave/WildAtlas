//
//  InsetMapView.swift
//  Africa
//
//  Created by Arjun Rana on 30/04/26.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629),
            span: MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40.0)
        )
    )
    var body: some View {
       
            Map(position: $cameraPosition)
            .overlay(
                NavigationLink(destination: MapView()){
                    HStack{
                        Image(systemName: "mappin.circle").foregroundColor(.white).imageScale(.large)
                        Text("Location").foregroundStyle(.accent)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical , 10)
                    .padding(.horizontal , 14)
                    .background(
                        Color.black.opacity(0.4)
                            .cornerRadius(8)
                    )
                }.padding(12)
                , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
               
        
        
    }
}

#Preview {
    InsetMapView()
}
