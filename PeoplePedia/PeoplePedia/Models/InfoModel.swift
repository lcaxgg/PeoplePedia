//
//  InfoModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct InfoModel: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

