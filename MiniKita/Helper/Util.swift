//
//  Util.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 20/05/24.
//

import Foundation
import SwiftUI

func backgroundColorTop(condition: CalorieCondition) -> Color {
    return if condition == .full || condition == .complete {
        Color("IguanaGreen")
    } else if condition == .over {
        Color("PersianRed")
    } else {
        Color("Rajah")
    }
}

func backgroundColorBottom(condition: CalorieCondition) -> Color {
    return if condition == .full || condition == .complete {
        Color("LightGreens")
    } else if condition == .over {
        Color("CoralRed")
    } else {
        Color("PeachOrange")
    }
}

func backgroundColorEachCalorie(condition: CalorieCondition) -> Color {
    return if condition == .over {
        Color("CoralRed")
    } else {
        Color("MaximumBlueGreen")
    }
}

func calculateAge(birthDate: Date) -> Int {
    let calendar = Calendar.current
    let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
    let age = ageComponents.year!
    return age
}

func differeceDay(from: Date) -> Int {
    let calendar = Calendar.current
    let dayComponents = calendar.dateComponents([.day], from: from, to: Date())
    let difference = dayComponents.day!
    return difference
}

func defineActivityLevel(often: ActivityOften, minute: ActivityMinute) -> ActivityLevel {
    return if often == .everyday {
        if minute == .zerominutes {
            ActivityLevel.sedentary
        } else if minute == .twentyminutes {
            ActivityLevel.lightlyActive
        } else if minute == .sixtyminutes {
            ActivityLevel.veryActive
        } else {
            ActivityLevel.extraActive
        }
    } else if often == .dedicate {
        if minute == .zerominutes {
            ActivityLevel.sedentary
        } else if minute == .twentyminutes {
            ActivityLevel.lightlyActive
        } else {
            ActivityLevel.veryActive
        }
    } else {
        if minute == .zerominutes {
            ActivityLevel.sedentary
        } else if minute == .twentyminutes {
            ActivityLevel.lightlyActive
        } else {
            ActivityLevel.moderatelyActive
        }
    }
}

func calculateTotalCalorie(weight: Int, height: Int, age: Int, gender: Gender, activityLevel: ActivityLevel) -> Double {
    var totalCalorie = 0.0
    
    totalCalorie = if gender == .male {
        (88.4 + (13.4 * Double(weight))) + (4.8 * Double(height)) - (5.68 * Double(age))
    } else {
        (447.6 + (9.25 * Double(weight))) + (3.1 * Double(height)) - (4.33 * Double(age))
    }
    
    totalCalorie = if activityLevel == .sedentary {
        totalCalorie * 1.2
    } else if activityLevel == .lightlyActive {
        totalCalorie * 1.375
    } else if activityLevel == .moderatelyActive {
        totalCalorie * 1.55
    } else if activityLevel == .veryActive {
        totalCalorie * 1.725
    } else {
        totalCalorie * 1.9
    }
    
    return totalCalorie
}

func calculateDailyNutrient(totalCalorie: Double) -> (protein: Double, fat: Double, carb: Double, fiber: Double) {
    
    let protein = totalCalorie * 0.35
    let fat = totalCalorie * 0.35
    let carb = totalCalorie * 0.65
    
    return (protein: protein, fat: fat, carb: carb, fiber: 1)
}

func getTotalMinimumCalorieLimit(totalCalorie: Double, nutritionType: NutritionType) -> (minimumCalorie: Double, minimumPercentage: Double) {
    let minimumCalorieLimitPercentage : Double = switch nutritionType {
    case .protein:
        0.25571
    case .fat:
        0.57143
    case .carb:
        0.69231
    case .fiber:
        1
    case .calorie:
        1
    }
    
    return (minimumCalorie: totalCalorie * minimumCalorieLimitPercentage, minimumPercentage: minimumCalorieLimitPercentage)
}

func checkIsChallengeComplete(
    consumedCalorie: (protein: Double, fat: Double, carb: Double, fiber: Double),
    minimumCalorie: (protein: Double, fat: Double, carb: Double, fiber: Double)
) -> Bool {
    return checkIsNutrientAchieve(consumedCalorie: consumedCalorie.carb, minimumCalorie: minimumCalorie.carb) &&
    checkIsNutrientAchieve(consumedCalorie: consumedCalorie.fat, minimumCalorie: minimumCalorie.fat) &&
    checkIsNutrientAchieve(consumedCalorie: consumedCalorie.protein, minimumCalorie: minimumCalorie.protein) &&
    checkIsNutrientAchieve(consumedCalorie: consumedCalorie.fiber, minimumCalorie: minimumCalorie.fiber)
}

func checkIsNutrientAchieve(consumedCalorie: Double, minimumCalorie: Double) -> Bool {
    return consumedCalorie >= minimumCalorie
}

func decimalFormat(number: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 2
    
    let formattedNumber = numberFormatter.string(from: NSNumber(value: number))
    return formattedNumber!
}

func getIngredientCalorie(selectedAmount: FoodUnits, selectedNutrition: Nutrition) -> (calorie: Double, protein: Double, fat: Double, carb: Double, fiber: Double) {
    let selectedNutritionInfo = switch selectedAmount.unit {
    case .gram:
        selectedNutrition.nutritionDetail.inGram
    case .piece:
        selectedNutrition.nutritionDetail.inPortion
    case .tablespoon:
        selectedNutrition.nutritionDetail.inGram
    }
    
    
    var valueDouble = Double(selectedAmount.value)
    
    if selectedAmount.unit == .tablespoon {
        valueDouble = valueDouble * 14.75
    }
    
    let calorie = valueDouble * selectedNutritionInfo.calorie
    let protein = valueDouble * (selectedNutritionInfo.protein)
    let fat = valueDouble * (selectedNutritionInfo.fat)
    let carb = valueDouble * (selectedNutritionInfo.carb)
    let fiber = valueDouble * (selectedNutritionInfo.fiber)
    return (calorie: calorie, protein: protein, fat: fat, carb: carb, fiber: fiber)
}

func filterIngredients(query : String) -> [Ingredient] {
    return if query.isEmpty {
        ingredients
    }else
    {
        ingredients.filter{
            $0.ingredientName.contains(query)
        }
    }
}
