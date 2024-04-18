//
//  MockDobModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockDobModel: Codable {
    let date: String
    let age: Int
}

extension MockDobModel {
    static func getMockDob() -> MockDobModel {
        MockDobModel(date: "1992-03-08T15:13:16.688Z", age: 30)
    }
}
