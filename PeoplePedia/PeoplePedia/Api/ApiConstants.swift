//
//  ApiConstants.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct ApiConstants {
    static let scheme = "https"
    static let baseUrl = "randomuser.me"
    static let path = "/api/"
    static let queryItems: [URLQueryItem] = [URLQueryItem(name: "results", value: String(100))]
}


