//
//  CharactersCollectionViewModel.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

protocol CharactersCollectionViewModelProtocol {
    var characters: [HarryPotter] { get }
    func fetchCharacter(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CharactersCollectionViewModelCellProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailCharacterViewModelProtocol
    
}

class CharactersCollectionViewModel: CharactersCollectionViewModelProtocol{
    
    private let url = "https://potterapi.onrender.com/en/characters"
    
    var characters = [HarryPotter]()
    
    func fetchCharacter(completion: @escaping () -> Void) {
        NetworkManager.fetchData(url: url) { [weak self] (results) in
            guard let self = self else { return }
                self.characters = results
                completion()
            print(results.count)
            }
        }

    func numberOfRows() -> Int {
        characters.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CharactersCollectionViewModelCellProtocol {
        let character = characters[indexPath.row]
        return CharactersCollectionViewModelCell(characters: character)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailCharacterViewModelProtocol {
        let detail = characters[indexPath.row]
        return DetailCharacterViewModel(character: detail)
    }
    
}
