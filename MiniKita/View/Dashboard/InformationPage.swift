//
//  InformationPage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct InformationPage: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Daily Challenge")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(.antiFlashWhite)
                            .padding(.bottom, 2)
                        
                        Text("Boost Your Macronutrient Health with a Variety of Foods! ")
                            .font(.title)
                            .fontWeight(.regular)
                            .foregroundStyle(.antiFlashWhite)
                            .padding(.bottom, 4)
                            
                        
                        Text("Why do we need macronutrients? Proteins build muscles, carbs provide energy, and fats enhance vitamin absorption. Balancing them is key for energy, metabolism, and daily performance.")
                            .font(.callout)
                            .foregroundStyle(.antiFlashWhite)
                            
                        
                    }
                    .padding(16)
                    .hSpacing()
                    .background(
                        .jungleGreen,
                        in: .rect(
                            cornerRadii: RectangleCornerRadii(
                                bottomLeading: 10,
                                bottomTrailing: 10
                            )
                        )
                    )
                    
                    HStack(alignment: .center) {
                        Text("Here's the Scoop!")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundStyle(.carrotOrange)
                        
                        Spacer()
                        
                        Image(.ngintip2)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 94)
                            .offset(y: -20)
                    }
                    .padding(.horizontal, 16)
                    
                    VStack {
                        Text("Start the healthy lifestyle to fulfill your macronutrient intake and enjoy unlimited fiber. Fuel your body with balanced proteins, carbs, and healthy fats, while keeping your digestion happy with plenty of fiber.")
                            .font(.subheadline)
                            .foregroundStyle(.onyx)
                    }
                    .padding(.horizontal, 16)
                    .offset(y: -20)
                    
                }
                
                
            }
            .navigationTitle("Information")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.jungleGreen, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
    }
}

#Preview {
    NavigationStack {
        InformationPage()
    }
}
