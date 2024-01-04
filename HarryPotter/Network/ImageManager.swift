//
//  ImageManager.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import Foundation

class ImageManageer {
    static let shared = ImageManageer()
    
    private init() {}
    
    func fetchImage(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}

