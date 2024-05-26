//
//  RecapHistory.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct RecapHistory: View {
    
    var ingredientName: String
    var ingredientType: String
    var coockingType: String
    var amount: String
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
            if !ingredientType.isEmpty {
                detailIngredient.append(ingredientType)
            }
            
            if !coockingType.isEmpty {
                detailIngredient.append(coockingType)
            }
            
            if !amount.isEmpty {
                detailIngredient.append(amount)
            }
        }
    }
}

#Preview {
    RecapHistory(
        ingredientName: "Chicken",
        ingredientType: "Breast",
        coockingType: "Fried",
        amount: "150 gram",
        calorie: 159,
        time: Date()
    )
}
