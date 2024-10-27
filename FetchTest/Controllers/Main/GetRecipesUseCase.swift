//
//  GetRecipesUseCase.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

protocol GetRecipesUseCase {
    func getRecipies(completion: @escaping (Result<RecipeResponseModel, APIError>) -> Void)
}

class GetRecipesUseCaseImp: GetRecipesUseCase {
    func getRecipies(completion: @escaping (Result<RecipeResponseModel, APIError>) -> Void) {
        NetworkManager.shared.getRecipies(completion: completion)
    }
}
