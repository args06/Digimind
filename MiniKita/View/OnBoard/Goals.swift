//
//  Goals.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 07/05/24.
//

import SwiftUI

struct Goals: View {
    
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
                Goals()
            } label: {
                Text("action_next")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
            }
            .buttonStyle(.borderedProminent)
            .padding(16)
        }
    }
}

#Preview {
    NavigationStack {
        Goals()
    }
}
