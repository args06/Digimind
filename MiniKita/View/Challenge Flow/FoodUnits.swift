//
//  FoodUnits.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 21/05/24.
//

import Foundation
struct FoodUnits {
  let value: Int
  let unit: Unit
    
  enum Unit: String, CaseIterable {
    case gram, piece, teaspoon, tablespoon
  }
}
