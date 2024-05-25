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
    
    @State var totalMinimumCalorieLimit = (minimumCalorie: 0.0, minimumPercentage: 0.0)
    
    @State var calorieCondition: CalorieCondition = .under
    
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
                    totalMinimumCalorieLimit = getTotalMinimumCalorieLimit(
                        totalCalorie: totalNutritionCalorie,
                        nutritionType: nutritionType
                    )
                    
                    progress = CGFloat(consumedNutritionCalorie) / CGFloat(totalMinimumCalorieLimit.minimumCalorie)
                    
                    print("\(nutritionType.rawValue) : Total Min : \(totalMinimumCalorieLimit)")
                    print("\(nutritionType.rawValue) : Total Calorie : \(totalNutritionCalorie)")
                    print("\(nutritionType.rawValue) : Progress : \(progress)")
                    
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
        let newProgress = CGFloat(consumedNutritionCalorie) / CGFloat(totalNutritionCalorie)
        
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
        
        print("\(nutritionType.rawValue) : NewProgress : \(newProgress)")
    }
}

#Preview {
    NutritionButton(
        consumedNutritionCalorie: .constant(365),
        nutritionType: .carb,
        totalNutritionCalorie: 2250
    )
}
