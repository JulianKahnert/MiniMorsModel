//
//  DataPoint+Location.swift
//  
//
//  Created by Julian Kahnert on 18.10.19.
//

import Foundation

extension DataPoint {
    public struct Location: Codable, Hashable, Equatable {
        public let latitude: Double
        public let longitude: Double

        public init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
}
