//
//  DetailCharacterViewModel.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 13.01.2024.
//

import Foundation
import UIKit

protocol DetailCharacterViewModelProtocol {
    var name: String? {get}
    var fullName: String? {get}
    var hogwartsHouse: String? {get}
    var image: Data? {get}
    var hogwartsHouseImage: UIImage? {get}
    var birthdate: String? {get}
    
    init(character: HarryPotter)
}

class DetailCharacterViewModel: DetailCharacterViewModelProtocol {
  
    var name: String? {
        "\(character.fullName ?? "")"
    }
    
    var hogwartsHouse: String? {
        "\(character.hogwartsHouse ?? "")"
    }
    
    var hogwartsHouseImage: UIImage? {
        UIImage(named: character.hogwartsHouse!)
    }
    
    var fullName: String? {
        "\(character.fullName ?? "")"
    }
    
    var image: Data? {
        let imageUrl = URL(string: character.image!)
        return ImageManageer.shared.fetchImage(from: imageUrl)
    }
    
    var birthdate: String? {
        "\(character.birthdate ?? "")"
    }
    
    private let character: HarryPotter
    
    required init(character: HarryPotter) {
        self.character = character
    }
}
