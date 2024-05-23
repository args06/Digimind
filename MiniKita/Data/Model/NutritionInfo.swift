//
//  NutritionInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct NutritionInfo: Codable {
    let calorie: Double
    let protein: Double
    let fat: Double
    let carb: Double
    let fiber: Double
    let weight: Double

    enum CodingKeys: String, CodingKey {
        case calorie
        case protein
        case fat
        case carb
        case fiber
        case weight
    }
}
