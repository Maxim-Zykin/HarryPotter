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
    //func viewModelForSelectedRow(at IndexPath: IndexPath) -> DetailViewModelProtocol
    
}

class CharactersCollectionViewModel: CharactersCollectionViewModelProtocol{
    
    private let url = "https://hp-api.onrender.com/api/characters"
    
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
    
}
