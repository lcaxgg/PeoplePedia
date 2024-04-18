//
//  ApiEndPoint.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct ApiEndPoint {
    static var url: URL? {
        var components = URLComponents()
        components.scheme = ApiConstants.scheme
        components.host = ApiConstants.baseUrl
        components.path = ApiConstants.path
        components.queryItems = ApiConstants.queryItems
        
        let methodQueryItem = URLQueryItem(name: "method", value: HTTPMethodEnum.get.rawValue)
        components.queryItems?.append(methodQueryItem)
        
        return components.url
    }
}
