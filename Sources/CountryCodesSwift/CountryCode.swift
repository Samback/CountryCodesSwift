//
//  File.swift
//  
//
//  Created by Max Tymchii on 01.09.2023.
//

import Foundation

public struct CountryCode: Codable {
    public let name: String
    public let code: String
    public let dialCode: String
    public let emoji: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case code
        case dialCode = "dial_code"
        case emoji
    }
}


