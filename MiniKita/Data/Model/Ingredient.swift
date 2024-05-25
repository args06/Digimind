//
//  Ingredient.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct Ingredient: Codable, Hashable {
    var ingredientName: String = ""
    var nutritionType: NutritionType = .carb
    var availableUnit: [Unit] = [.gram]
    var ingredientPart: [IngredientPart] = [IngredientPart()]

    enum CodingKeys: String, CodingKey {
        case ingredientName = "ingredient_name"
        case nutritionType = "nutrition_type"
        case availableUnit = "available_unit"
        case ingredientPart = "ingredient_part"
    }
}
