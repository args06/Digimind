//
//  DailyIntake.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import Foundation
import SwiftData

@Model
class DailyIntake {
    @Attribute(.unique)
    var identifier: String = UUID().uuidString
    
    var ingredientName: String = ""
    var nutritionType: NutritionType = NutritionType.carb
    var ingredientPart: String = ""
    var cookingType: String = ""
    var consumableAmount: FoodUnits = FoodUnits()
    var consumableNutrition: NutritionInfo = NutritionInfo()
    var time: Date = Date()
    var challenge: Challenge?
    
    init(identifier: String, ingredientName: String, nutritionType: NutritionType, ingredientPart: String, cookingType: String, consumableAmount: FoodUnits, consumableNutrition: NutritionInfo, time: Date, challenge: Challenge? = nil) {
        self.identifier = identifier
        self.ingredientName = ingredientName
        self.nutritionType = nutritionType
        self.ingredientPart = ingredientPart
        self.cookingType = cookingType
        self.consumableAmount = consumableAmount
        self.consumableNutrition = consumableNutrition
        self.time = time
        self.challenge = challenge
    }
    
    init() {
        self.identifier = ""
        self.ingredientName = ""
        self.nutritionType = NutritionType.carb
        self.ingredientPart = ""
        self.cookingType = ""
        self.consumableAmount = FoodUnits()
        self.consumableNutrition = NutritionInfo()
        self.time = Date()
        self.challenge = nil
    }
}
