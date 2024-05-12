//
//  Allergies.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 07/05/24.
//

import SwiftUI

struct AllergiesPage: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("desc_ask_allergies")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(allergies, id: \.self) { allergy in
                            LongButton(label: allergy.name) {
                                
                            }
                        }
                    }
                    .padding(.top, 18)
                }
            }
            .navigationTitle("title_allergies")
            .navigationBarTitleDisplayMode(.inline)
            .padding(12)
            .safeAreaInset(edge: .bottom) {
                NavigationLink {
                    DislikesPage()
                } label: {
                    Text("action_next")
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
}

#Preview {
    NavigationStack {
        AllergiesPage()
    }
}
