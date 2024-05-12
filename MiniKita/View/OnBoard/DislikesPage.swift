//
//  DislikesPage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 12/05/24.
//

import SwiftUI

struct DislikesPage: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("desc_ask_allergies")
                    .font(.subheadline)
                    .fontWeight(.regular)
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], 
                    spacing: 12
                ) {
                    ForEach(dislikes, id: \.self) { dislike in
                        LongButton(label: dislike.name) {
                            
                        }
                    }
                }
                .padding(.top, 18)
            }
        }
        .navigationTitle("title_dislikes")
        .navigationBarTitleDisplayMode(.inline)
        .padding(12)
        .safeAreaInset(edge: .bottom) {
            NavigationLink {
                // TODO: Connect to Groceries Page
            } label: {
                Text("action_generate")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .hSpacing()
                    .frame(height: 50)
                    .background(Color("IguanaGreen"), in: .rect(cornerRadius: 12))
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    NavigationStack {
        DislikesPage()
    }
}
