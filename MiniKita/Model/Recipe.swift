//
//  File.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 13/05/24.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable,Hashable {
    var id = UUID().uuidString
    var name: String
    var desc: String
    var categories: String
    var mainIngredients: Ingredients
    var calories: Int
    var ingredients: [Ingredients]
    var direction: [String]
}

var recipes: [Recipe] = [
    Recipe(
        name: "Tuna Steaks with Garlic, Tomatoes, Capers, and Basil",
        desc: "Serve with Chardonnay or Sauvignon Blanc.",
        categories: "Meat",
        mainIngredients: Ingredients(name: "Tuna"),
        calories: 398,
        ingredients: [
            Ingredients(
                name: "Extra-virgin Olive Oil",
                amount: 6,
                unit: UnitType.tbs
            ),
            Ingredients(
                name: "Onion",
                amount: 2,
                unit: UnitType.cup,
                desc: "Chopped"
            ),
            Ingredients(
                name: "Garlic",
                amount: 2,
                unit: UnitType.clove,
                desc: "Minced"
            ),
            Ingredients(
                name: "Fresh Basil Leaves",
                amount: 1,
                unit: UnitType.cup
            ),
            Ingredients(
                name: "Caper",
                amount: 1.5,
                unit: UnitType.tbs,
                desc: "Rinsed"
            ),
            Ingredients(
                name: "Ahi Tuna",
                amount: 4,
                unit: UnitType.piece,
                desc: "Each about 1 inch thick of steak cuts"
            )
        ],
        direction: [
            "Heat 3 tablespoons extra-virgin olive oil in heavy large skillet over medium heat.",
            "Add onions; sauté until tender, about 5 minutes. Add garlic; sauté until golden, about 3 minutes.",
            "Stir in tomatoes, basil, and capers. Simmer uncovered until mixture thickens, stirring occasionally, about 15 minutes.",
            "Meanwhile, heat remaining 3 tablespoons oil in another heavy large skillet over medium heat.",
            "Sprinkle fish with salt and pepper. Add fish to skillet and cook until light brown at edges but pink in center, about 3 minutes per side.",
            "Pour in tomato mixture. Simmer until fish is opaque in center, about 5 minutes longer. Serve fish immediately."
        ]
    ),
    Recipe(
        name: "Tuna Steaks with Garlic, Tomatoes, Capers, and Basil",
        desc: "Serve with Chardonnay or Sauvignon Blanc.",
        categories: "Meat",
        mainIngredients: Ingredients(name: "Tuna"),
        calories: 398,
        ingredients: [
            Ingredients(
                name: "Extra-virgin Olive Oil",
                amount: 6,
                unit: UnitType.tbs
            ),
            Ingredients(
                name: "Onion",
                amount: 2,
                unit: UnitType.cup,
                desc: "Chopped"
            ),
            Ingredients(
                name: "Garlic",
                amount: 2,
                unit: UnitType.clove,
                desc: "Minced"
            ),
            Ingredients(
                name: "Fresh Basil Leaves",
                amount: 1,
                unit: UnitType.cup
            ),
            Ingredients(
                name: "Caper",
                amount: 1.5,
                unit: UnitType.tbs,
                desc: "Rinsed"
            ),
            Ingredients(
                name: "Ahi Tuna",
                amount: 4,
                unit: UnitType.piece,
                desc: "Each about 1 inch thick of steak cuts"
            )
        ],
        direction: [
            "Heat 3 tablespoons extra-virgin olive oil in heavy large skillet over medium heat.",
            "Add onions; sauté until tender, about 5 minutes. Add garlic; sauté until golden, about 3 minutes.",
            "Stir in tomatoes, basil, and capers. Simmer uncovered until mixture thickens, stirring occasionally, about 15 minutes.",
            "Meanwhile, heat remaining 3 tablespoons oil in another heavy large skillet over medium heat.",
            "Sprinkle fish with salt and pepper. Add fish to skillet and cook until light brown at edges but pink in center, about 3 minutes per side.",
            "Pour in tomato mixture. Simmer until fish is opaque in center, about 5 minutes longer. Serve fish immediately."
        ]
    ),
]


