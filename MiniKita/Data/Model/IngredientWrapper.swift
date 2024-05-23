//
//  IngredientWrapper.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation

struct IngredientWrapper: Codable {
    let ingredients: [Ingredient]

    enum CodingKeys: String, CodingKey {
        case ingredients = "ingredients"
    }
}
