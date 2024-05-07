//
//  Allergies.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 07/05/24.
//

import SwiftUI

struct Allergies: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("desc_ask_allergies")
                    .font(.subheadline)
                    .fontWeight(.regular)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(allergies, id: \.self) { allergy in
                        LongButton(label: allergy) {
                            
                        }
                    }
                }
                .padding(.top, 18)
            }
        }
        .navigationTitle("Allergies")
        .navigationBarTitleDisplayMode(.inline)
        .padding(12)
        .safeAreaInset(edge: .bottom) {
            NavigationLink {
                // TODO: Connect to Dislike Page
            } label: {
                Text("action_next")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .hSpacing()
                    .frame(height: 50)
                    .background(Color("Primary"), in: .rect(cornerRadius: 12))
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    NavigationStack {
        Allergies()
    }
}
