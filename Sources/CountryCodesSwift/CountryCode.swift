//
//  File.swift
//  
//
//  Created by Max Tymchii on 01.09.2023.
//

import Foundation

public struct CountryCode: Codable {
    let name: String
    let code: String
    let dialCode: String
    let emoji: String

    enum CodingKeys: String, CodingKey {
        case name
        case code
        case dialCode = "dial_code"
        case emoji
    }
}


