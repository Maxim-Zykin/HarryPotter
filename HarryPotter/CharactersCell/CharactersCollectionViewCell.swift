//
//  CharactersCollectionViewCell.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "charactersCell"
    
    var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 80/255, green: 74/255, blue: 141/255, alpha: 255/255)
        return view
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.image = UIImage(named: "noPhoto")
        return image
    }()
    
    var name: UILabel! = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.lineBreakMode = NSLineBreakMode.byCharWrapping
        label.numberOfLines = 0
        return label
    }()
    
    var viewModel: CharactersCollectionViewModelCellProtocol! {
        didSet{
            self.name.text = viewModel.name
            DispatchQueue.global().async {
                guard let imageData = self.viewModel.image else { return }
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        image.frame = CGRect(x: 10, y: 10, width: 140, height: 140)
    }
    
    func setupUI(){
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        
        contentView.addSubview(view)
        contentView.addSubview(image)
        contentView.addSubview(name)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        //image.translatesAutoresizingMaskIntoConstraints = false
        
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        image.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

        
        name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
}
