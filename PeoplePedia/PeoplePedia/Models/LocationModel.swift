//
//  LocationModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct LocationModel: Codable {
    let street: StreetModel
    let city, state, country: String
    let postcode: PostCodeEnum
    let coordinates: CoordinatesModel
    let timezone: TimezoneModel
}
