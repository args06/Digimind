//
//  RecapHistory.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct RecapHistory: View {
    
    var ingredientName: String
    var ingredientPart: String
    var coockingType: String
    var amount: FoodUnits
    var calorie: Int
    var time: Date
    
    @State var detailIngredient: [String] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Divider()
                .padding(.vertical, 16)
            
            HStack(alignment: .center) {
                Text(ingredientName)
                    .font(.callout)
                    .fontWeight(.medium)
                
                Spacer()
                
                Text(time.formatted(date: .omitted, time: .shortened))
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.phillipineGray)
            }
            
            Text("\(detailIngredient.joined(separator: " | ")) • \(calorie) kCal")
                .font(.system(size: 14))
                .fontWeight(.regular)
            
        }
        .onAppear {
            if !ingredientPart.isEmpty {
                detailIngredient.append(ingredientPart)
            }
            
            if !coockingType.isEmpty {
                detailIngredient.append(coockingType)
            }
            
            let amounts = "\(amount.value) \(amount.unit)"
            detailIngredient.append(amounts)
        }
    }
}

#Preview {
    RecapHistory(
        ingredientName: "Chicken",
        ingredientPart: "Breast",
        coockingType: "Fried",
        amount: FoodUnits(value: 2, unit: .gram),
        calorie: 159,
        time: Date()
    )
}
