//
//  File.swift
//  
//
//  Created by Max Tymchii on 01.09.2023.
//

import Foundation

extension String {
    var fullPhoneNumber: String {
        "+" + self
            .filter { $0.isNumber }
    }
}
