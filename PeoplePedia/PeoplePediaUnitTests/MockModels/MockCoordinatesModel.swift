//
//  MockCoordinatesModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockCoordinatesModel: Codable {
    let latitude, longitude: String
}

extension MockCoordinatesModel {
    static func getMockCoordinate() -> MockCoordinatesModel {
        MockCoordinatesModel(latitude: "-69.8246", longitude: "134.8719")
    }
}
