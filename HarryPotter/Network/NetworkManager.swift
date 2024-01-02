//
//  NetworkManager.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

final class NetworkManager<T: Decodable> {
    static func fetchData(url: String, compltion: @escaping (Result<T, NetworkError>)-> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let person = try decoder.decode(T.self, from: data)
                compltion(.success(person))
            } catch let error {
                print("Error \(error.localizedDescription)")
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}
