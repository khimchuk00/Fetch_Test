//
//  MainViewModel.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func updateData(dataSource: [Recipe])
    func showError(errorType: APIError)
}

class MainViewModel {
    private var getImagesUseCase: GetRecipesUseCase
    
    // MARK: - PhotoListViewModelDelegate
    weak var delegate: MainViewModelDelegate?
    
    init(delegate: MainViewModelDelegate?, getImagesUseCase: GetRecipesUseCase = GetRecipesUseCaseImp()) {
        self.delegate = delegate
        self.getImagesUseCase = getImagesUseCase
    }
    
    func getImages() {
        getImagesUseCase.getRecipies() { [weak self] response in
            switch response {
            case .success(let recipiesResponse):
                self?.delegate?.updateData(dataSource: recipiesResponse.recipesList)
            case .failure(let error):
                self?.delegate?.showError(errorType: error)
            }
        }
    }
    
    func refresh() {
        getImages()
    }
}
