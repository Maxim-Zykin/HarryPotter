//
//  CharactersCollectionViewModelCell.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

protocol CharactersCollectionViewModelCellProtocol {
    var name: String { get }
    //var image: Data? { get }
    init(characters: HarryPotter)
}

class CharactersCollectionViewModelCell: CharactersCollectionViewModelCellProtocol{
    
    private var characters: HarryPotter
    
    var name: String {
        characters.name ?? ""
    }
    
//    var image: Data? {
//        ImageManageer.shared.fetchImage(from: characters.image)
//    }
    
    required init(characters: HarryPotter) {
        self.characters = characters
    }
    
    
}
