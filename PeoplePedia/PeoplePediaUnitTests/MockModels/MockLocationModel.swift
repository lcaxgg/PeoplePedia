//
//  MockLocationModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockLocationModel: Codable {
    let street: MockStreetModel
    let city, state, country, postcode: String
    let coordinates: MockCoordinatesModel
    let timezone: MockTimezoneModel
}

extension MockLocationModel {
    static func getMockLocation() -> MockLocationModel {
        let mockStreetModel = MockStreetModel.getMockStreet()
        let mockCoordinatesModel = MockCoordinatesModel.getMockCoordinate()
        let mockTimezoneModel = MockTimezoneModel.getMockTimeZone()
       
        let mockLocationModel = MockLocationModel(street: mockStreetModel,
                                                  city: "Billings",
                                                  state: "Michigan",
                                                  country: "United States",
                                                  postcode: "63104",
                                                  coordinates: mockCoordinatesModel,
                                                  timezone: mockTimezoneModel)
        
        return mockLocationModel
    }
}
