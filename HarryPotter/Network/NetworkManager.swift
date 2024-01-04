//
//  NetworkManager.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

class NetworkManager{
    static func fetchData(url: String, completion: @escaping (_ courses: [HarryPotter])-> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let course = try decoder.decode([HarryPotter].self, from: data)
                completion(course)
            } catch let error {
                print(error)
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
