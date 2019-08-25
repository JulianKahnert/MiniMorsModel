//
//  MiniMorsModel.swift
//
//
//  Created by Julian Kahnert on 12.08.19.
//

import Foundation

@available(iOS 10.0, *)
public struct DataPoint: Codable, Hashable {

    public var id: Int?
    public let timestamp: Date
    public var isDeleted: Bool
    public let data: DataPoint.Data

    public init(timestamp: Date, isDeleted: Bool, data: DataPoint.Data) {
        self.timestamp = timestamp
        self.isDeleted = isDeleted
        self.data = data
    }
}
