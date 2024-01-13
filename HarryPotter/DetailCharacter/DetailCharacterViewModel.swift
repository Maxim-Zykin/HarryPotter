//
//  DetailCharacterViewModel.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 13.01.2024.
//

import Foundation

protocol DetailCharacterViewModelProtocol {
    var name: String? {get}
    var fullName: String? {get}
    var hogwartsHouse: String? {get}
    var image: Data? {get}
    
    init(character: HarryPotter)
}

class DetailCharacterViewModel: DetailCharacterViewModelProtocol {
  
    var name: String? {
        "\(character.fullName ?? "")"
    }
    
    var hogwartsHouse: String? {
        "\(character.hogwartsHouse ?? "")"
    }
    
    var fullName: String? {
        "\(character.fullName ?? "")"
    }
    
    var image: Data? {
        let imageUrl = URL(string: character.image!)
        return ImageManageer.shared.fetchImage(from: imageUrl)
    }
    
    private let character: HarryPotter
    
    required init(character: HarryPotter) {
        self.character = character
    }
}
