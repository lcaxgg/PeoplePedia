//
//  PeoplePediaUnitTests.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import XCTest

final class PeoplePediaUnitTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testFetchPersonDetails_Failed() {
        do {
            let mockData = MockPersonModel.getMockDataForFailed()
            let jsonData = try JSONEncoder().encode(mockData)
            
            let mockUrlSessionNetworkService = MockUrlSessionService()
            mockUrlSessionNetworkService.mockData = jsonData
            
            let mockDataHandler = MockDataHandler(mockApiClientProtocol: mockUrlSessionNetworkService)
            
            mockDataHandler.fetchProcessedData { result in
                switch result {
                case .success(let data):
                    XCTAssert(type(of: data) == MockPersonModel.self)
                case .failure(let error):
                    XCTFail("\(error.localizedDescription)")
                }
            }
        } catch let exception {
            print(exception)
        }
    }
    
    func testFetchPersonDetails_Success() {
        do {
            let mockData = MockPersonModel.getMockDataForSuccess()
            let jsonData = try JSONEncoder().encode(mockData)
            
            let mockUrlSessionNetworkService = MockUrlSessionService()
            mockUrlSessionNetworkService.mockData = jsonData
            
            let mockDataHandler = MockDataHandler(mockApiClientProtocol: mockUrlSessionNetworkService)
            
            mockDataHandler.fetchProcessedData { result in
                switch result {
                case .success(let data):
                    XCTAssert(type(of: data) == MockPersonModel.self)
                case .failure(let error):
                    XCTFail("\(error.localizedDescription)")
                }
            }
        } catch let exception {
            print(exception)
        }
    }
}
