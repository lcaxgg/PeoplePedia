//
//  MockUrlSessionService.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

class MockUrlSessionService: MockApiClientProtocol {
    var mockData: Data?
    var mockError: Error?
    
    func fetchData(with url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        // assuming that there's an actual api call happened
        
        if let error = mockError {
            print("Failed to fetch data from the server.")
            completion(.failure(error))
        } else if let data = mockData {
            print("Data successfully retrieved from the server.")
            completion(.success(data))
        } else {
            let unknownError = NSError(domain: "UnknownError", code: 0, userInfo: nil)
            print("UnknownError")
            completion(.failure(unknownError))
        }
    }
}
