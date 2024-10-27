//
//  RecipeResponseModel.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

struct RecipeResponseModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case recipes
    }
    
    var recipesList: [Recipe] = []
        
    init(from decoder: Decoder) throws {
        let recipes = try decoder.container(keyedBy: CodingKeys.self)
        recipesList = try recipes.decode([Recipe].self, forKey: .recipes)
    }
}
