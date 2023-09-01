//
//  File.swift
//  
//
//  Created by Max Tymchii on 01.09.2023.
//

import Foundation

extension String {
    var fullPhoneNumber: String {
         self.contains("+") ? self : "+" + self
    }
}
