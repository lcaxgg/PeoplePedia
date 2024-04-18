//
//  MockPictureModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockPictureModel: Codable {
    let large, medium, thumbnail: String
}

extension MockPictureModel {
    static func getMockPicture() -> MockPictureModel {
        MockPictureModel(large: "https://randomuser.me/api/portraits/men/51.jpg",
                         medium: "https://randomuser.me/api/portraits/med/men/51.jpg",
                         thumbnail: "https://randomuser.me/api/portraits/thumb/men/51.jpg")
    }
}
