//
//  MockIdModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockIdModel: Codable {
    let name, value: String
}

extension MockIdModel {
    static func getMockId() -> MockIdModel {
        MockIdModel(name: "SSN", value: "405-88-3636")
    }
}
