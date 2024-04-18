//
//  PostCodeEnum.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

enum PostCodeEnum: Codable {
    case string(String)
    case int(Int)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let stringPostcode = try? container.decode(String.self) {
            self = .string(stringPostcode)
            return
        }
        
        if let intPostcode = try? container.decode(Int.self) {
            self = .int(intPostcode)
            return
        }
        
        throw DecodingError.typeMismatch(PostCodeEnum.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected to decode Int or String"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        }
    }
}
