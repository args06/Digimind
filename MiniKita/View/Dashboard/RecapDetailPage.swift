//
//  RecapDetailPage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI
import SwiftData


struct RecapDetailPage: View {
    
    var nutritionType : NutritionType = .protein
    @ObservedObject var intakeViewModel : IntakeViewModel
    
    @State var consumedCalorie = 0.0
    @State var totalCalorie = 0.0
    @State var calorieProgress = 0.0
    
    @Query var dailyIntakes: [DailyIntake]
    
    @State var todaysIntake : [DailyIntake] = []
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(nutritionType.rawValue) Intake")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                
                Image("\(nutritionType)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 57)
                
                Text("\(Int(consumedCalorie)) kCal")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                
                if !(nutritionType == .fiber) {
                    Text("\(Int(calorieProgress * 100))% of your daily \(nutritionType) (\(Int(totalCalorie)) kCal)")
                        .font(.caption)
                }
                
                ForEach(todaysIntake, id: \.self) { data in
                    RecapHistory(
                        ingredientName: data.ingredientName,
                        ingredientPart: data.ingredientPart,
                        coockingType: data.cookingType,
                        amount: data.consumableAmount,
                        calorie: Int(data.consumableNutrition.calorie),
                        time: data.time
                    )
                }
                .padding(.horizontal, 16)
            }
            .onAppear {
                switch nutritionType {
                case .protein:
                    consumedCalorie = intakeViewModel.consumedProtein
                    totalCalorie = intakeViewModel.latestChallenge.dailyNutritionLimit.protein
                    calorieProgress = intakeViewModel.proteinProgress
                case .fat:
                    consumedCalorie = intakeViewModel.consumedFat
                    totalCalorie = intakeViewModel.latestChallenge.dailyNutritionLimit.fat
                    calorieProgress = intakeViewModel.fatProgress
                case .carb:
                    consumedCalorie = intakeViewModel.consumedCarb
                    totalCalorie = intakeViewModel.latestChallenge.dailyNutritionLimit.carb
                    calorieProgress = intakeViewModel.carbProgress
                case .fiber:
                    consumedCalorie = intakeViewModel.fiberProgress
                    totalCalorie = intakeViewModel.latestChallenge.dailyNutritionLimit.fiber
                    calorieProgress = intakeViewModel.fiberProgress
                case .calorie: break
                    
                }
                
                todaysIntake = dailyIntakes.filter {
                    $0.challenge?.identifier == intakeViewModel.latestChallenge.identifier
                }.filter {
                    $0.nutritionType == self.nutritionType
                }
            }
            .onChange(of: dailyIntakes) {
                todaysIntake = dailyIntakes.filter {
                    $0.challenge?.identifier == intakeViewModel.latestChallenge.identifier
                }.filter {
                    $0.nutritionType == self.nutritionType
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RecapDetailPage(intakeViewModel: IntakeViewModel())
    }
}
