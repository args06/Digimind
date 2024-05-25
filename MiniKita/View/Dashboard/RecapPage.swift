//
//  recapPage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct RecapPage: View {
    
    @State var isChallengeComplete = true
    
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
                
                Text("2.149 kCal")
                    .font(.system(size: 40))
                    .fontWeight(.medium)
                
                Text("99% of your daily calories (2.150 kCal)")
                    .font(.caption)
                
                Divider()
                    .padding(16)
                
                NavigationLink {
                    RecapDetailPage(nutritionType: .protein)
                } label: {
                    HistoryCard(
                        nutritionType: .protein,
                        consumedCalorie: 345,
                        totalCalorie: 1200
                    )
                }
                
                NavigationLink {
                    RecapDetailPage(nutritionType: .fat)
                } label: {
                    HistoryCard(
                        nutritionType: .fat,
                        consumedCalorie: 345,
                        totalCalorie: 1200
                    )
                    .padding(.top, 12)
                }
                
                NavigationLink {
                    RecapDetailPage(nutritionType: .carb)
                } label: {
                    HistoryCard(
                        nutritionType: .carb,
                        consumedCalorie: 345,
                        totalCalorie: 1200
                    )
                    .padding(.top, 12)
                }
                
                NavigationLink {
                    RecapDetailPage(nutritionType: .fiber)
                } label: {
                    HistoryCard(
                        nutritionType: .fiber,
                        consumedCalorie: 345,
                        totalCalorie: 1200
                    )
                    .padding(.top, 12)
                }
            }
            .padding(16)
        }
        .background(.antiFlashWhite)
    }
}

#Preview {
    NavigationStack {
        RecapPage()
    }
}
