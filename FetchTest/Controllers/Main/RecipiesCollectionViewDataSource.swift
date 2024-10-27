//
//  RecipesCollectionViewDataSource.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

protocol RecipesCollectionViewDataSource {
    func update(with dataSource: [Recipe])
    func configure(with collectionView: UICollectionView)
}

final class RecipesCollectionViewDataSourceAdapter: NSObject, RecipesCollectionViewDataSource {
    // MARK: - Dependencies
    private var dataSource: [Recipe] = []
    
    func update(with dataSource: [Recipe]) {
        self.dataSource = dataSource
    }
    
    func configure(with collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: RecipeCell.self)
        configureLayout(for: collectionView)
    }
    
    // MARK: - Helpers
    private func configureLayout(for collectionView: UICollectionView) {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: Theme.Dimensions.marginSmall, left: Theme.Dimensions.marginSmall, bottom: Theme.Dimensions.marginSmall, right: Theme.Dimensions.marginSmall)
        collectionView.collectionViewLayout = layout
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension RecipesCollectionViewDataSourceAdapter: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2

        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cell(cellType: RecipeCell.self, for: indexPath)
        cell.configure(with: RecipeCellViewModel(recipe: dataSource[indexPath.item], delegate: cell))
        return cell
    }
}
