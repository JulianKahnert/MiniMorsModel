//
//  MiniMorsModel.swift
//
//
//  Created by Julian Kahnert on 12.08.19.
//

import Foundation

@available(iOS 10.0, *)
struct DataPoint: Codable {
    let time: Date
    let isDeleted: Bool
    let data: Data
}
