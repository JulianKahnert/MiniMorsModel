//
//  MiniMorsModel+Data.swift
//  
//
//  Created by Julian Kahnert on 12.08.19.
//

import Foundation

extension MiniMorsModel {
    enum Data {
        case poo(numberTwo: Bool)
        case feeding(Quantity)
        case bodyTemperature(Measurement<UnitTemperature>)
    }
}

extension MiniMorsModel.Data: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case payload
    }

    @available(iOS 10.0, *)
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "poo":
            let payload = try container.decode(Bool.self, forKey: .payload)
            self = .poo(numberTwo: payload)
        case "feeding":
            let payload = try container.decode(MiniMorsModel.Quantity.self, forKey: .payload)
            self = .feeding(payload)
        case "bodyTemperature":
            let payload = try container.decode(Measurement<UnitTemperature>.self, forKey: .payload)
            self = .bodyTemperature(payload)
        default:
            fatalError("Error: Could not parse the type '\(type)'.")
        }
    }

    func encode(to encoder: Encoder) throws {
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
        }
    }
}
