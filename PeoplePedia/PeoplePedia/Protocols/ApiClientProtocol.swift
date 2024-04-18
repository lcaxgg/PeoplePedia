//
//  ApiClientProtocol.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

protocol ApiClientProtocol {
    func fetchData(with url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
