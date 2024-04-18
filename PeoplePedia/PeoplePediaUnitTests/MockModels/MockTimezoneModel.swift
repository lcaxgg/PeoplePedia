//
//  MockTimezoneModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockTimezoneModel: Codable {
    let offset, description: String
}

extension MockTimezoneModel {
    static func getMockTimeZone() -> MockTimezoneModel {
        MockTimezoneModel(offset: "+9:30", description: "Adelaide, Darwin")
    }
}
