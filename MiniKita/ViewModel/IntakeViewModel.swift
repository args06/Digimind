//
//  IntakeViewModel.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 23/05/24.
//

import Foundation
import SwiftData
import Observation

class IntakeViewModel: ObservableObject {
    
    @Published var filteredIngredients : [Ingredient] = ingredients
    
    @Published var selectedIngredient = Ingredient()
    @Published var selectedPart = IngredientPart()
    @Published var selectedNutrition = Nutrition()
    @Published var selectedAmount = FoodUnits(value: 1, unit: .gram)
    
    @Published var consumedDailyCalorie: Double = 0
    
    @Published var consumedProtein: Double = 0
    @Published var consumedFat: Double = 0
    @Published var consumedCarb: Double = 0
    @Published var consumedFiber: Double = 0
    
    @Published var calorieProgress: CGFloat = 0
    @Published var proteinProgress: CGFloat = 0
    @Published var fatProgress: CGFloat = 0
    @Published var carbProgress: CGFloat = 0
    @Published var fiberProgress: CGFloat = 0
    
    @Published var latestChallenge = Challenge()
}
