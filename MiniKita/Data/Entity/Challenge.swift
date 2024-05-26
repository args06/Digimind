//
//  Challenge.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import Foundation
import SwiftData

@Model
class Challenge {
    @Attribute(.unique)
    var identifier: String = UUID().uuidString
    
    var challengeDate: Date = Date()
    var day: Int = 1
    var dailyNutrition: NutritionInfo = NutritionInfo()
    var dailyNutritionLimit: NutritionInfo = NutritionInfo()
    var isComplete: Bool = false
    
    @Relationship(deleteRule: .cascade, inverse: \DailyIntake.challenge) var dailyIntakes: [DailyIntake]?
    
    init(identifier: String, challengeDate: Date, day: Int, dailyNutrition: NutritionInfo, dailyNutritionLimit: NutritionInfo, isComplete: Bool, dailyIntakes: [DailyIntake]? = nil) {
        self.identifier = identifier
        self.challengeDate = challengeDate
        self.day = day
        self.dailyNutrition = dailyNutrition
        self.dailyNutritionLimit = dailyNutritionLimit
        self.isComplete = isComplete
        self.dailyIntakes = dailyIntakes
    }
    
    init() {
        self.identifier = ""
        self.challengeDate = Date()
        self.day = 0
        self.dailyNutrition = NutritionInfo()
        self.dailyNutritionLimit = NutritionInfo()
        self.isComplete = false
        self.dailyIntakes = nil
    }
}
