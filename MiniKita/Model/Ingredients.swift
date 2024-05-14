//
//  Goals.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 07/05/24.
//

import Foundation
import SwiftUI

struct Ingredients: Hashable {
    var name: String
    var amount: Double?
    var unit: UnitType?
    var desc: String?
}

enum UnitType: String{
    case tbs = "Table Spoon"
    case tsp = "Tea Spoon"
    case cup = "Cup"
    case pound = "Pound"
    case clove = "Clove"
    case ounce = "Ounce"
    case sprig = "Sprig"
    case piece = "Piece"
}
