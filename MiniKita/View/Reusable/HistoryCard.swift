//
//  HistoryCard.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct HistoryCard: View {
    
    var nutritionType : NutritionType = .protein
    var consumedCalorie : Double = 0.0
    var totalCalorie : Double = 0.0
    
    var isFiber = false
    
    @State var calorieProgress : Double = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("\(nutritionType.rawValue) Intake")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.onyx)
            
            HStack(alignment: .center) {
                Image("\(nutritionType)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26)
                
                Text("\(Int(consumedCalorie)) kCal")
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                if !isFiber {
                    ProgressBar(
                        progress: calorieProgress,
                        height: 4,
                        foregroundColor: .jungleGreen
                    )
                    .frame(height: 4)
                }
            }
            
            if !isFiber {
                Text("\(Int(calorieProgress * 100))% of your daily \(nutritionType) (\(Int(consumedCalorie)) kCal)")
                    .foregroundStyle(.black)
            }
        }
        .padding(16)
        .hSpacing(.leading)
        .background(.ghostWhite, in: .rect(cornerRadius: 10))
    }
}

#Preview {
    HistoryCard(
        nutritionType: .fiber,
        consumedCalorie: 345,
        totalCalorie: 1200,
        isFiber: true
    )
}
