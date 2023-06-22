//
//  Character.swift
//  GameOfThronesIOS5
//
//  Created by Colton Brenneman on 6/22/23.
//

import Foundation

struct TopLevelDictionary: Decodable {
    private enum CodingKeys: String, CodingKey {
        case characterID = "id"
        case firstName
        case lastName
        case characterTitle = "title"
        case characterFamily = "family"
        case characterImage = "imageUrl"
    }
    let characterID: Int
    let firstName: String
    let lastName: String
    let characterTitle: String
    let characterFamily: String
    let characterImage: String
}
