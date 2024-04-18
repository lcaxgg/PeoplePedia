//
//  MockResultModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockResultModel: Codable {
    let id: MockIdModel
    let name: MockNameModel
    let gender: String
    let dob: MockDobModel
    let registered: MockRegisteredModel
    let location: MockLocationModel
    let nat: String
    let email: String
    let phone, cell: String
    let picture: MockPictureModel
}
