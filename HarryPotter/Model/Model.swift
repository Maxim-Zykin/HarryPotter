//
//  Model.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

struct HarryPotter: Codable {
    let nickname: String?
    let fullName: String?
    let hogwartsHouse: String?
    let image: String?
    let birthdate: String?
}
enum Link: String {
    case API = "https://hp-api.onrender.com/api/characters"
}
