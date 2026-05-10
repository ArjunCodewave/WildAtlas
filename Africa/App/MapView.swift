//
//  MapView.swift
//  Africa
//
//  Created by Arjun Rana on 21/04/26.
//

import SwiftUI
import MapKit
struct MapView: View {
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 35.0, longitudeDelta: 35.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let location : [NationalParkLocation] = Bundle.main.decode("locations.json")
    var body: some View {
        
       //MARK: - No1 BASIC MAP
        ///Map(coordinateRegion: $region)
        //MARK: - No2 Advanced MAP
        Map(coordinateRegion: $region , annotationItems: location , annotationContent: {
            item in
            // ((A.)) PIN: OLD STYLE (always static)
            //MapPin(coordinate: item.location , tint: .accentColor)
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image(item.image).resizable().scaledToFit().frame(width: 32 , height: 32 , alignment: .center)
//            }
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }).overlay(
            HStack(alignment: .center , spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48 , height: 48 , alignment: .center)
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accent)
                        Spacer()
                        Text("\(region.center.latitude)").font(.footnote).foregroundColor(.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accent)
                        Spacer()
                        
                        Text("\(region.center.longitude)").font(.footnote).foregroundColor(.white)
                    }
                    
                }
            }.padding(.vertical , 12)
                .padding(.horizontal , 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding(),alignment: .top
                )
            
    }
}

#Preview {
    MapView()
}
