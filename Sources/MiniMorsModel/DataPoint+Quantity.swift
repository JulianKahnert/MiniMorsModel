//
//  DataPoint+Quantity.swift
//  
//
//  Created by Julian Kahnert on 12.08.19.
//

import Foundation

extension DataPoint {
    public enum Quantity: Int, Codable {
        case good
        case normal
        case bad
    }
}
