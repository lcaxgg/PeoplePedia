//
//  DataHandler.swift
//  PersonPediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

class MockFetchService {
    let mockApiClientProtocol: MockApiClientProtocol
    
    init(mockApiClientProtocol: MockApiClientProtocol) {
        self.mockApiClientProtocol = mockApiClientProtocol
    }
    
    func fetchProcessedData(completion: @escaping (Result<MockPersonModel, Error>) -> Void) {
        let url = URL(string: "https://example.com/api/data")!
        
        mockApiClientProtocol.fetchData(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let mockPersonModel = try JSONDecoder().decode(MockPersonModel.self, from: data)
            
                    print("JSON data successfully decoded into MockPersonModel.")
                    completion(.success(mockPersonModel))
                } catch {
                    print("\(error.localizedDescription)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
