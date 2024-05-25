//
//  IngredientPart.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct IngredientPart: Codable, Hashable {
    var partName: String = ""
    var nutrition: [Nutrition] = [Nutrition()]

    enum CodingKeys: String, CodingKey {
        case partName = "part_name"
        case nutrition
    }
}
