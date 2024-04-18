//
//  ResultModel.swift
//  PeoplePediaUnitTests
//
//  Created by j8bok on 4/15/24.
//

import Foundation

struct ResultModel: Codable {
    let id: IdModel
    let name: NameModel
    let gender: String
    let dob: DobModel
    let registered: RegisteredModel
    let location: LocationModel
    let nat: String
    let email: String
    let phone, cell: String
    let picture: PictureModel
}
