//
//  Ingredient.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct Ingredient: Codable {
    let ingredientName: String
    let nutritionType: NutritionType
    let availableUnit: [Unit]
    let ingredientPart: [IngredientPart]

    enum CodingKeys: String, CodingKey {
        case ingredientName = "ingredient_name"
        case nutritionType = "nutrition_type"
        case availableUnit = "available_unit"
        case ingredientPart = "ingredient_part"
    }
}
