//
//  RecipeCellViewModel.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

protocol RecipeCellDelegate: AnyObject {
    func updateRecipe(image: ImageData, recipe: Recipe)
}

protocol RecipeCellProtocol {
    func getImage()
}

class RecipeCellViewModel: RecipeCellProtocol {
    private var recipe: Recipe
    private var observersAttached = false
    
    weak var delegate: RecipeCellDelegate?
    
    init(recipe: Recipe, delegate: RecipeCellDelegate? = nil) {
        self.recipe = recipe
        self.delegate = delegate
    }
    
    func getImage() {
        let url = recipe.photo_url_small ?? recipe.photo_url_large
        guard let url else { return }
        
        if !observersAttached {
            CacheManager.shared.observers[url] = self
            observersAttached = true
        }
       
        let imageData = CacheManager.shared.getImage(by: url)
        delegate?.updateRecipe(image: imageData, recipe: recipe)
    }
}

// MARK: - ImagesObserver
extension RecipeCellViewModel: ImagesObserver {
    func updateImages() {
        let url = recipe.photo_url_small ?? recipe.photo_url_large
        guard let url else { return }
        let imageData = CacheManager.shared.getImage(by: url)
        delegate?.updateRecipe(image: imageData, recipe: recipe)
    }
}
