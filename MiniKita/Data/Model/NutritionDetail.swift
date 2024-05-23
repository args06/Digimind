//
//  NutritionDetail.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

struct NutritionDetail: Codable {
    let inGram: NutritionInfo
    let inPortion: NutritionInfo

    enum CodingKeys: String, CodingKey {
        case inGram = "in_gram"
        case inPortion = "in_portion"
    }
}
