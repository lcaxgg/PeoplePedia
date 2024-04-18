//
//  MockStreetModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockStreetModel: Codable {
    let number: Int
    let name: String
}

extension MockStreetModel {
    static func getMockStreet() -> MockStreetModel {
        MockStreetModel(number: 8929, name: "Valwood Pkwy")
    }
}
