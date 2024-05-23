//
//  IngredientPart.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct IngredientPart: Codable {
    let partName: String
    let nutrition: [Nutrition]

    enum CodingKeys: String, CodingKey {
        case partName = "part_name"
        case nutrition
    }
}
