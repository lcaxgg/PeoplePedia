//
//  MockApiClientProtocol.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

protocol MockApiClientProtocol {
    func fetchData(with url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
