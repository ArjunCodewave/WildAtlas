//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Arjun Rana on 21/04/26.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T{
        //1. LOCATE the json file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("fail to locate\(file) in bundel")
        }
        //2. Create a PROPERTY For the DAta
        guard let data = try? Data(contentsOf: url) else{
            fatalError("failed to loard \(file) from the bundel.")
        }
        //3. Create a decoder
        let decoder = JSONDecoder()
        //4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        // Return the ready-to-use data
        print(loaded)
        return loaded
    }
}
