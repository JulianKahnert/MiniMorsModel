//
//  MiniMorsModel.swift
//
//
//  Created by Julian Kahnert on 12.08.19.
//

import Foundation

@available(iOS 10.0, *)
public struct DataPoint: Codable, Hashable {
    public let time: Date
    public let isDeleted: Bool
    public let data: DataPoint.Data

    public init(time: Date, isDeleted: Bool, data: DataPoint.Data) {
        self.time = time
        self.isDeleted = isDeleted
        self.data = data
    }
}
