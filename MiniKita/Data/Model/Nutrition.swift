//
//  Nutrition.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct Nutrition: Codable, Hashable {
    var cookingType: String = ""
    var nutritionDetail: NutritionDetail = NutritionDetail()

    enum CodingKeys: String, CodingKey {
        case cookingType = "cooking_type"
        case nutritionDetail = "nutrition_detail"
    }
}
