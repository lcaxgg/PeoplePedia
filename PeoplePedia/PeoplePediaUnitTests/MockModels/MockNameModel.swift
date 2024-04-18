//
//  MockNameModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockNameModel: Codable {
    let title, first, last: String
}

extension MockNameModel {
    static func getMockName() -> MockNameModel {
        MockNameModel(title: "Mr.", first: "Arseniy", last: "Bih")
    }
}
