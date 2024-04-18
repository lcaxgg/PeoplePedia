//
//  MockInfoModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockInfoModel: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

extension MockInfoModel {
    static func getMockInfo() -> MockInfoModel {
        MockInfoModel(seed: "038fa17100cd876b", results: 1, page: 1, version: "1.4")
    }
}
