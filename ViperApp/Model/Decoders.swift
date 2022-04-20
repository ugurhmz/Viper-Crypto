//
//  Decoders.swift
//  ViperApp
//
//  Created by ugur-pc on 20.04.2022.
//

import Foundation

public enum Decoders {
    
    public static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
