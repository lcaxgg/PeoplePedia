//
//  UrlSessionNetworkService.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

class UrlSessionService: ApiClientProtocol {
    func fetchData(with url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let task =  URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch data from the server.")
                completion(.failure(error))
            } else if let data = data {
                print("Data successfully retrieved from the server.")
                completion(.success(data))
            } else {
                let unknownError = NSError(domain: "UnknownError", code: 0, userInfo: nil)
                print("UnknownError")
                completion(.failure(unknownError))
            }
        }
        
        task.resume()
    }
}
