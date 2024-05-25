//
//  IntakeViewModel.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 23/05/24.
//

import Foundation

class IntakeViewModel: ObservableObject {
    
    @Published var selectedIngredient = Ingredient()
    @Published var selectedPart = IngredientPart()
    @Published var selectedNutrition = Nutrition()
    @Published var selectedAmount = FoodUnits(value: 1, unit: .gram)
    
    @Published var consumedDailyCalorie: Double = 0
    
    @Published var consumedProtein: Double = 0
    @Published var consumedFat: Double = 0
    @Published var consumedCarb: Double = 0
    @Published var consumedFiber: Double = 0
    
//    func calculateDailyNutrition() -> Double {
//
//    }
}
