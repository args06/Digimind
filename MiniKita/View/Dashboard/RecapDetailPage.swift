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
                
                Text("2.149 kCal")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                
                Text("99% of your daily \(nutritionType) (2.150 kCal)")
                    .font(.caption)
                
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
        }
    }
}

#Preview {
    NavigationStack {
        RecapDetailPage()
    }
}
