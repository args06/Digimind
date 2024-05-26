//
//  recapPage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct RecapPage: View {
    
    @State var isChallengeComplete = true
    
    @ObservedObject var intakeViewModel : IntakeViewModel
    
    @State var calorieProgress : Double = 0.0
    
    var body: some View {
        ScrollView {
            VStack {
                if isChallengeComplete {
                    RecapBadge()
                        .padding(8)
                    
                    Divider()
                        .padding(.horizontal, 16)
                }
                
                Text("Recap")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                
                Image(.calorie)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 57)
                
                Text("\(Int(intakeViewModel.consumedDailyCalorie)) kCal")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                
                Text("\(Int(intakeViewModel.calorieProgress * 100))% of your daily calories (\(Int(intakeViewModel.latestChallenge.dailyNutrition.calorie)) kCal)")
                    .font(.caption)
                
                Divider()
                    .padding(16)
                
                NavigationLink {
                    RecapDetailPage(
                        nutritionType: .protein,
                        intakeViewModel: intakeViewModel
                    )
                } label: {
                    HistoryCard(
                        nutritionType: .protein,
                        consumedCalorie: intakeViewModel.consumedProtein,
                        totalCalorie: intakeViewModel.latestChallenge.dailyNutritionLimit.protein,
                        calorieProgress: intakeViewModel.proteinProgress
                    )
                }
                
                NavigationLink {
                    RecapDetailPage(
                        nutritionType: .fat,
                        intakeViewModel: intakeViewModel
                    )
                } label: {
                    HistoryCard(
                        nutritionType: .fat,
                        consumedCalorie: intakeViewModel.consumedFat,
                        totalCalorie: intakeViewModel.latestChallenge.dailyNutritionLimit.fat,
                        calorieProgress: intakeViewModel.fatProgress
                    )
                    .padding(.top, 12)
                }
                
                NavigationLink {
                    RecapDetailPage(
                        nutritionType: .carb,
                        intakeViewModel: intakeViewModel
                    )
                } label: {
                    HistoryCard(
                        nutritionType: .carb,
                        consumedCalorie: intakeViewModel.consumedCarb,
                        totalCalorie: intakeViewModel.latestChallenge.dailyNutritionLimit.carb,
                        calorieProgress: intakeViewModel.carbProgress
                    )
                    .padding(.top, 12)
                }
                
                NavigationLink {
                    RecapDetailPage(
                        nutritionType: .fiber,
                        intakeViewModel: intakeViewModel
                    )
                } label: {
                    HistoryCard(
                        nutritionType: .fiber,
                        consumedCalorie: intakeViewModel.consumedFiber,
                        totalCalorie: intakeViewModel.latestChallenge.dailyNutritionLimit.fiber,
                        isFiber: true,
                        calorieProgress: intakeViewModel.fiberProgress
                    )
                    .padding(.top, 12)
                }
            }
            .padding(16)
        }
        .background(.antiFlashWhite)
        .onAppear {
            
            if intakeViewModel.latestChallenge.dailyNutrition.calorie == .zero {
                calorieProgress = 0
            } else {
                calorieProgress = CGFloat(intakeViewModel.consumedDailyCalorie) / CGFloat(intakeViewModel.latestChallenge.dailyNutrition.calorie)
            }
            intakeViewModel.calorieProgress = calorieProgress
        }
    }
}

#Preview {
    NavigationStack {
        RecapPage(intakeViewModel: IntakeViewModel())
    }
}
