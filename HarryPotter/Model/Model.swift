//
//  Model.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

struct HarryPotter: Codable {
    let name: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let wizard: Bool?
    let eyeColour: String?
    let hairColour: String?
    let patronus: String?
    let image: String?
}
enum Link: String {
    case API = "https://hp-api.onrender.com/api/characters"
}
