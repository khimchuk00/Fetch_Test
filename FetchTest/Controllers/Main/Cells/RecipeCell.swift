//
//  RecipeCell.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    // MARK: - Outlets
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var recipe: Recipe?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.photoImageView.image = UIImage(named: "default_img")
    }
    
    func configure(with model: RecipeCellProtocol) {
        startSpining()
        model.getImage()
    }
    
    // MARK: - Private methods
    private func startSpining() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func stopSpining() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}

// MARK: - PhotoCellDelegate
extension RecipeCell: RecipeCellDelegate {
    func updateRecipe(image: ImageData, recipe: Recipe) {
        self.recipe = recipe
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = recipe.name ?? "Unknown"
            self?.descriptionLabel.text = recipe.cuisine ?? "Unknown"
            
            switch image.state {
            case .exist, .notExist:
                self?.photoImageView.image = image.mainImage
                self?.stopSpining()
            case .loading:
                break
            }
        }
    }
}
