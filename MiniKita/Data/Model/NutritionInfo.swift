//
//  NutritionInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct NutritionInfo: Codable, Hashable {
    var calorie: Double = 0.0
    var protein: Double? = 0.0
    var fat: Double? = 0.0
    var carb: Double? = 0.0
    var fiber: Double? = 0.0
    var weight: Double? = 0.0

    enum CodingKeys: String, CodingKey {
        case calorie
        case protein
        case fat
        case carb
        case fiber
        case weight
    }
}
