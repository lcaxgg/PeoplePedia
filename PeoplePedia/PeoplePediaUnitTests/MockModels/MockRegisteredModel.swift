//
//  MockRegisteredModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockRegisteredModel: Codable {
    let date: String
    let age: Int
}

extension MockRegisteredModel {
    static func getMockRegistered() -> MockRegisteredModel {
        MockRegisteredModel(date: "2007-07-09T05:51:59.390Z", age: 14)
    }
}
