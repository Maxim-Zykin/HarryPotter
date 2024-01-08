//
//  CharactersCollectionViewModelCell.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

protocol CharactersCollectionViewModelCellProtocol {
    var name: String { get }
    var image: Data? { get }
    init(characters: HarryPotter)
}

class CharactersCollectionViewModelCell: CharactersCollectionViewModelCellProtocol{
    
    private var characters: HarryPotter
    
    var name: String {
        characters.name ?? ""
    }
    
    var image: Data? {
        let imageUrl = URL(string: characters.image!)
        return ImageManageer.shared.fetchImage(from: imageUrl)
    }
    
    required init(characters: HarryPotter) {
        self.characters = characters
    }
    
    
}
