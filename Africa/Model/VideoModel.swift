//
//  VideoModel.swift
//  Africa
//
//  Created by Arjun Rana on 06/05/26.
//

import Foundation
struct Video: Codable , Identifiable {
    let id : String
    let name : String
    let headline : String
    
    var thumbnail: String{
        "video-\(id)"
    }
    
}
