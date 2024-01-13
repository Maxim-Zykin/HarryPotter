//
//  CharactersCollectionViewModelCell.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

protocol CharactersCollectionViewModelCellProtocol {
    var nickname: String { get }
    var image: Data? { get }
    init(characters: HarryPotter)
}

class CharactersCollectionViewModelCell: CharactersCollectionViewModelCellProtocol{
    
    private var characters: HarryPotter
    
    var nickname: String {
        characters.nickname ?? ""
    }
    
    var image: Data? {
        let imageUrl = URL(string: characters.image!)
        return ImageManageer.shared.fetchImage(from: imageUrl)
    }
    
    required init(characters: HarryPotter) {
        self.characters = characters
    }
    
    
}
