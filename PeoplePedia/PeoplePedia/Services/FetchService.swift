//
//  FetchService.swift
//  PersonPedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

class DataHandler {
    let apiClientProtocol: ApiClientProtocol
    
    init(apiClientProtocol: ApiClientProtocol) {
        self.apiClientProtocol = apiClientProtocol
    }
    
    func fetchProcessedData(completion: @escaping (Result<PersonModel, Error>) -> Void) {
        guard let url = ApiEndPoint.url else { return }
     
        apiClientProtocol.fetchData(with: url) { result in
            switch result {
            case .success(let data):
                do {
                    let mockPersonModel = try JSONDecoder().decode(PersonModel.self, from: data)
            
                    print("JSON data successfully decoded into MockPersonModel.")
                    completion(.success(mockPersonModel))
                } catch {
                    print("\(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
