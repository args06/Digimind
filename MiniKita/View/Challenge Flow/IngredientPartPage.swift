//
//  SwiftUIView2.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import Foundation
import SwiftUI

struct IngredientPartPage: View {
    
    var parts: [String] = [
        "Breast", "Wings", "Thigh", "Fillet", "Drumstick"
    ]
    
    @State private var selectedPart = ""
    @State private var navigateToNextPage = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    Text("Which part of Chicken do you eat?")
                        .font(.headline)
                        .padding(.bottom, 24)
                    
                    VStack {
                        ForEach(parts, id: \.self) { part in
                            LongButton(
                                label: part,
                                buttonColor: (part == selectedPart) ?
                                Color("CarrotOrange") : Color("GhostWhite"),
                                textColor: (part == selectedPart) ?
                                Color("AntiFlashWhite") : Color("RaisinBlack"),
                                action: {
                                    selectedPart = part
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        navigateToNextPage = true
                                    }
                                }
                            )
                            .navigationDestination(
                                isPresented: $navigateToNextPage
                            ) {
                                IngredientAmountPage()
                            }
                        }
                    }
                    
                    Image("full")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 148)
                        .padding(.top, 93)
                }
                .padding(16)
            }
            .navigationTitle("Stew")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.antiFlashWhite)
        }
    }
}

#Preview {
    NavigationStack {
        IngredientPartPage()
    }
}
