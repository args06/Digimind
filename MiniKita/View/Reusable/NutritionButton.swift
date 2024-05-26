//
//  NutritionButton.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 21/05/24.
//

import SwiftUI

struct NutritionButton: View {
    
    @Binding var consumedNutritionCalorie: Double
    @State var progress: CGFloat = 0
    @State var startAnimation: CGFloat = 0
    
    var nutritionType: NutritionType = .carb
    
    var totalNutritionCalorie: Double = 0.0
    
    @State var calorieCondition: CalorieCondition = .under
    
    @ObservedObject var intakeViewModel : IntakeViewModel
    
    var body: some View {
        
        VStack {
            GeometryReader { proxy in
                let size = proxy.size
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.platinum)
                        .frame(width: 76, height: 76)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            backgroundColorEachCalorie(condition: calorieCondition)
                        )
                        .mask {
                            WaterWave(progress: progress, waveHeight: 0.015, offset: startAnimation)
                                .frame(width: 80)
                        }
                    
                    
                    VStack {
                        Image(nutritionType.rawValue.lowercased())
                            .resizable()
                            .frame(width: 53, height: 53)
                    }
                    .frame(width: 76, height: 76)
                }
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear {
                    
                    switch nutritionType {
                    case .protein:
                        progress = CGFloat(consumedNutritionCalorie) / CGFloat(intakeViewModel.latestChallenge.dailyNutritionLimit.protein)
                        intakeViewModel.proteinProgress = progress
                        
                    case .fat:
                        progress = CGFloat(consumedNutritionCalorie) / CGFloat(intakeViewModel.latestChallenge.dailyNutritionLimit.fat)
                        intakeViewModel.fatProgress = progress
                        
                    case .carb:
                        progress = CGFloat(consumedNutritionCalorie) / CGFloat(intakeViewModel.latestChallenge.dailyNutritionLimit.carb)
                        intakeViewModel.carbProgress = progress
                        
                    case .fiber:
                        progress = CGFloat(consumedNutritionCalorie) / CGFloat(intakeViewModel.latestChallenge.dailyNutritionLimit.fiber)
                        intakeViewModel.fiberProgress = progress
                        
                    case .calorie: break
                        
                    }
                    
                    if nutritionType.rawValue == NutritionType.fiber.rawValue {
                        if consumedNutritionCalorie > 0 {
                            progress = 0.9
                        }
                    }
                    
                    if !(progress == 0.0 || progress >= 1.0) {
                        withAnimation(.linear(duration: TimeInterval(1)).repeatForever(autoreverses: false)) {
                            startAnimation = size.width + 275
                        }
                    } else {
                        withAnimation(.linear(duration: TimeInterval(0)).repeatForever(autoreverses: false)) {
                            startAnimation = 0
                        }
                    }
                    
                    checkCalorieCondition()
                }
            }
            .frame(width: 76, height: 76)
            
            Text("\(Int(consumedNutritionCalorie)) kCal")
        }
        .frame(maxWidth: .infinity)
    }
    
    private func checkCalorieCondition() {
        var newProgress = 0.0
        
        if totalNutritionCalorie == .zero {
            newProgress = 0.0
        } else {
            newProgress = CGFloat(consumedNutritionCalorie) / CGFloat(totalNutritionCalorie)
        }
        
        if newProgress > 1 {
            calorieCondition = .over
        } else {
            calorieCondition = .under
        }
        
        if nutritionType.rawValue == NutritionType.fiber.rawValue {
            if consumedNutritionCalorie > 0 {
                progress = 0.9
                calorieCondition = .under
            }
        }
    }
}

#Preview {
    NutritionButton(
        consumedNutritionCalorie: .constant(365),
        nutritionType: .carb,
        totalNutritionCalorie: 2250,
        intakeViewModel: IntakeViewModel()
    )
}
