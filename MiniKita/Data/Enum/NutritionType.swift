//
//  NutritionType.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

enum NutritionType: String, CaseIterable, Codable, Hashable {
    case protein = "Protein"
    case fat = "Fat"
    case carb = "Carb"
    case fiber = "Fiber"
    case calorie = "Calorie"
}
