//
//  RecapDetailPage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct DailyIntake: Hashable {
    let ingredientName: String
    let ingredientType: String
    let coockingType: String
    let amount: String
    let calorie: Int
    let time: Date
}

struct RecapDetailPage: View {
    
    var nutritionType : NutritionType = .protein
    @ObservedObject var intakeViewModel : IntakeViewModel
    
    @State var consumedCalorie = 0.0
    @State var totalCalorie = 0.0
    @State var calorieProgress = 0.0
    
    var datas = [
        DailyIntake(
            ingredientName: "Chicken",
            ingredientType: "Breast",
            coockingType: "Fried",
            amount: "150 gram",
            calorie: 159,
            time: Date()
        ),
        DailyIntake(
            ingredientName: "Chicken",
            ingredientType: "Drumstick",
            coockingType: "Roast",
            amount: "2 pcs",
            calorie: 159,
            time: Date()
        ),
        DailyIntake(
            ingredientName: "Salmon",
            ingredientType: "",
            coockingType: "Roast",
            amount: "125 gram",
            calorie: 159,
            time: Date()
        ),
    ]
    
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
                
                ForEach(datas, id: \.self) { data in
                    RecapHistory(
                        ingredientName: data.ingredientName,
                        ingredientType: data.ingredientType,
                        coockingType: data.coockingType,
                        amount: data.amount,
                        calorie: data.calorie,
                        time: data.time
                    )
                }
                .padding(.horizontal, 16)
            }
            .onAppear {
                switch nutritionType {
                case .protein:
                    consumedCalorie = intakeViewModel.consumedProtein
                    totalCalorie = intakeViewModel.dailyNutrientLimit.protein
                    calorieProgress = intakeViewModel.proteinProgress
                case .fat:
                    consumedCalorie = intakeViewModel.consumedFat
                    totalCalorie = intakeViewModel.dailyNutrientLimit.fat
                    calorieProgress = intakeViewModel.fatProgress
                case .carb:
                    consumedCalorie = intakeViewModel.carbProgress
                    totalCalorie = intakeViewModel.dailyNutrientLimit.carb
                    calorieProgress = intakeViewModel.carbProgress
                case .fiber:
                    consumedCalorie = intakeViewModel.fiberProgress
                    totalCalorie = intakeViewModel.dailyNutrientLimit.fiber
                    calorieProgress = intakeViewModel.fiberProgress
                case .calorie: break
                    
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
