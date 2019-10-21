//
//  DataPoint+Data.swift
//  
//
//  Created by Julian Kahnert on 12.08.19.
//

import Foundation

extension DataPoint {
    public enum Data: Hashable {
        case poo(numberTwo: Bool)
        case feeding(SideQuantity)
        case bodyTemperature(Measurement<UnitTemperature>)
        case weight(Measurement<UnitMass>)
    }

    public struct SideQuantity: Codable, Hashable {
        public let quantity: Quantity
        public let side: Side

        public init(quantity: Quantity, side: Side) {
            self.quantity = quantity
            self.side = side
        }

        public enum Side: Int, Codable, Hashable {
            case left
            case right
        }
    }
}

extension DataPoint.Data: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case payload
    }

    @available(iOS 10.0, *)
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "poo", "0":
            let payload = try container.decode(Bool.self, forKey: .payload)
            self = .poo(numberTwo: payload)
        case "feeding", "1":
            let payload = try container.decode(DataPoint.SideQuantity.self, forKey: .payload)
            self = .feeding(payload)
        case "bodyTemperature":
            let payload = try container.decode(Measurement<UnitTemperature>.self, forKey: .payload)
            self = .bodyTemperature(payload)
        default:
            fatalError("Error: Could not parse the type '\(type)'.")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .poo(numberTwo: let payload):
            try container.encode("poo", forKey: .type)
            try container.encode(payload, forKey: .payload)
        case .feeding(let payload):
            try container.encode("feeding", forKey: .type)
            try container.encode(payload, forKey: .payload)
        case .bodyTemperature(let payload):
            try container.encode("bodyTemperature", forKey: .type)
            try container.encode(payload, forKey: .payload)
        case .weight(let payload):
            try container.encode("weight", forKey: .type)
            try container.encode(payload, forKey: .payload)
        }
    }
}
