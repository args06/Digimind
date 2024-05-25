//
//  NutritionDetail.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct NutritionDetail: Codable, Hashable {
    var inGram: NutritionInfo = NutritionInfo()
    var inPortion: NutritionInfo = NutritionInfo()

    enum CodingKeys: String, CodingKey {
        case inGram = "in_gram"
        case inPortion = "in_portion"
    }
}
