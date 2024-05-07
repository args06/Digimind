//
//  Goals.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 07/05/24.
//

import SwiftUI

struct GoalsPage: View {
    
    var body: some View {
        VStack {
            Text("desc_ask_goal")
                .font(.subheadline)
                .fontWeight(.regular)
            
            VStack(spacing: 10) {
                LongButton(label: "action_lose_weight") {
                    
                }
                
                LongButton(label: "action_gain_weight") {
                    
                }
                
                LongButton(label: "action_maintain_weight") {
                    
                }
                
                LongButton(label: "action_meal_plan") {
                    
                }
            }
            .padding(.top, 18)
            
            Spacer()
        }
        .navigationTitle("Goals")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .safeAreaInset(edge: .bottom) {
            NavigationLink {
                AllergiesPage()
            } label: {
                Text("action_next")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .hSpacing()
                    .frame(height: 50)
                    .background(.gray, in: .rect(cornerRadius: 12))
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    NavigationStack {
        GoalsPage()
    }
}
