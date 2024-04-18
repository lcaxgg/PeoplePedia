//
//  MockPersonModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct MockPersonModel: Codable {
    let results: [MockResultModel]
    let info: MockInfoModel
}

extension MockPersonModel {
    static func getMockDataForSuccess() -> MockPersonModel {
        let mockIdModel = MockIdModel.getMockId()
        let mockNameModel = MockNameModel.getMockName()
        let mockDobModel = MockDobModel.getMockDob()
        let mockRegisteredModel = MockRegisteredModel.getMockRegistered()
        let mockLocationModel = MockLocationModel.getMockLocation()
        let mockPictureModel = MockPictureModel.getMockPicture()
        let mockResultModel = MockResultModel(id: mockIdModel,
                                              name: mockNameModel,
                                              gender: "Male",
                                              dob: mockDobModel,
                                              registered: mockRegisteredModel,
                                              location: mockLocationModel,
                                              nat: "US",
                                              email: "arseniy.bih@example.com",
                                              phone: "(272) 790-0888",
                                              cell: "(489) 330-2385",
                                              picture: mockPictureModel)
        let mockInfoModel = MockInfoModel.getMockInfo()
        let mockPersonModel = MockPersonModel(results: [mockResultModel], info: mockInfoModel)

        return mockPersonModel
    }
    
    static func getMockDataForFailed() -> Data {
        let data = Data()
        return data
    }
}
