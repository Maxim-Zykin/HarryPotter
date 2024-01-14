//
//  CharactersCollectionView.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 02.01.2024.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

class CharactersCollectionView: UIViewController {

    lazy var collectionView = UICollectionView (
        frame: .zero,
    collectionViewLayout: makeLayout()
    )
    
    private var viewModel: CharactersCollectionViewModelProtocol!{
        didSet {
            viewModel.fetchCharacter {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MusicHelper.sharedHelper.playBackgroundMusic()
        viewModel = CharactersCollectionViewModel()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupUI()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarApperanse = UINavigationBarAppearance()
        navBarApperanse.configureWithOpaqueBackground()
        navBarApperanse.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarApperanse.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarApperanse.backgroundColor = UIColor(
            red: 36/255,
            green: 38/255,
            blue: 50/255,
            alpha: 255/255
        )
        
        navigationController?.navigationBar.standardAppearance = navBarApperanse
        navigationController?.navigationBar.scrollEdgeAppearance = navBarApperanse
    }
    
    func makeLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 25
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(160),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(190))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func setupUI() {
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: CharactersCollectionViewCell.cellID)
        collectionView.backgroundColor = UIColor(
            red: 36/255,
            green: 38/255,
            blue: 50/255,
            alpha: 255/255
        )
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CharactersCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCollectionViewCell.cellID, for: indexPath) as! CharactersCollectionViewCell
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
}

extension CharactersCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailCharacterView()
        let info = viewModel.viewModelForSelectedRow(at: indexPath)
        
        DispatchQueue.global().async {
            guard let imageData = info.image else { return }
            DispatchQueue.main.async {
                detail.imagePerson.image = UIImage(data: imageData)
            }
        }
        
        detail.fullName.text = info.fullName
        detail.hogwartsHouse.text = info.hogwartsHouse
        
        navigationController?.pushViewController(detail, animated: true)
    }
}
