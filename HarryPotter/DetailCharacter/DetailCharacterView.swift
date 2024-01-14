//
//  DetailCharacterView.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 13.01.2024.
//

import Foundation
import UIKit

class DetailCharacterView: UIViewController {
    
    var character: HarryPotter!
    
    private let sctollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.isDirectionalLockEnabled = true
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var imagePerson: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    
    var hogwartsHouseImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        return image
    }()
    
    
    var fullName = CustomLabel(text: "", textAlignment: .center, size: 30, color: .white, font: .bold)
    
    var hogwartsHouse = CustomLabel(text: "", textAlignment: .center, size: 25, color: .white, font: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor(
            red: 36/255,
            green: 38/255,
            blue: 50/255,
            alpha: 255/255
        )
        
        view.addSubview(sctollView)
        sctollView.addSubview(contentView)
        
        sctollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            sctollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            sctollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sctollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sctollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.sctollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.sctollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.sctollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.sctollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.sctollView.widthAnchor)
        ])
        
        self.view.addSubview(imagePerson)
        self.view.addSubview(fullName)
        self.view.addSubview(hogwartsHouse)
        self.view.addSubview(hogwartsHouseImage)
        
        imagePerson.translatesAutoresizingMaskIntoConstraints = false
        fullName.translatesAutoresizingMaskIntoConstraints = false
        hogwartsHouse.translatesAutoresizingMaskIntoConstraints = false
        hogwartsHouseImage.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            imagePerson.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            imagePerson.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            imagePerson.widthAnchor.constraint(equalToConstant: 290),
            imagePerson.heightAnchor.constraint(equalToConstant: 350),
            
            fullName.topAnchor.constraint(equalTo: self.imagePerson.bottomAnchor, constant: 20),
            fullName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            fullName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                        
            hogwartsHouseImage.topAnchor.constraint(equalTo: self.fullName.bottomAnchor, constant: 20),
            hogwartsHouseImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            hogwartsHouseImage.widthAnchor.constraint(equalToConstant: 150),
            hogwartsHouseImage.heightAnchor.constraint(equalToConstant: 150),
            
            hogwartsHouse.topAnchor.constraint(equalTo: self.hogwartsHouseImage.bottomAnchor, constant: 10),
            hogwartsHouse.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            hogwartsHouse.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            hogwartsHouse.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
        
        ])
    }
}
