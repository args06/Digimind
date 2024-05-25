//
//  OnboardingViewModel.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 25/05/24.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    @Published var selectedGenderType = 0
    @Published var selectedNutritionType = 0
    @Published var selectedActivelyMoveType = 0
    @Published var selectedActivelyMove2Type = 0
    @Published var selectedWorkoutPlaceType = 0
    @Published var selectedSkillType = 0
    @Published var selectedFoodType = 0
    
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    let genders: [String] = [
        "Male",
        "Female",
        "Other"
    ]
    
    let nutrition:[String] = [
        "Veganism",
        "No Restrictions"
    ]
    
    let skillLevel:[String] = [
        "Noob",
        "Skilled",
        "Expert"
    ]
    
    let activelyMove:[String] = [
        "Never",
        "1-2 times a week",
        "3-4 times a week",
        "5-6 times a week",
        "Every day"
    ]
    
    let activelyMove2:[String] = [
        "Zero minutes",
        "20 minutes",
        "60 minutes",
        "120 minutes or more"
    ]
    
    let foodTypes: [String] = [
        "Fruits",
        "Fish",
        "Salad",
        "Dairy",
        "Chicken",
        "Protien"
    ]
    
    let foodIcons: [String] = [
        "apple",
        "fish",
        "vegetables",
        "milk",
        "chicken",
        "egg"
    ]
    
    let workoutIcons: [String] = [
        "home-icon",
        "gym-icon",
        "outdoor-icon"
    ]
    
    let workoutLocationTypes: [String] = [
        "Home",
        "Gym",
        "Outdoor"
    ]
}
