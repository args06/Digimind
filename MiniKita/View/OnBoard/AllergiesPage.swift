//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct AllergiesPage: View {
    @State private var selectedAllergies : [Ingredient] = []
    @State private var search : String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                ProgressBar(
                    progress: 5/6,
                    height: 4,
                    foregroundColor: .maximumBlueGreen
                )
                .padding(.horizontal, 16)
                .padding(.top, 1)
                .frame(height: 1)
                
                VStack{
                    Text("Got allergies? Let us know to keep things awesome!")
                        .font(.headline)
                        .hSpacing()
                        .multilineTextAlignment(.center)
                        
                    
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                        spacing: 12
                    ) {
                        ForEach(filterIngredients(query: search), id: \.self) { allergy in
                            LongButtonHighlight(
                                label: allergy.ingredientName,
                                buttonColor: (selectedAllergies.contains(allergy)) ?
                                Color("CarrotOrange") : Color("GhostWhite"),
                                textColor: (selectedAllergies.contains(allergy)) ?
                                Color("AntiFlashWhite") : Color("RaisinBlack"),
                                action: {
                                    if selectedAllergies.contains(allergy) {
                                        let index = selectedAllergies.firstIndex(of: allergy)
                                        selectedAllergies.remove(at: index!)
                                    } else {
                                        selectedAllergies.append(allergy)
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    }
                                }
                            )
                            
                        }
                    }
                    .padding()
                    
                }
                .padding()
                Text("No allergies? Awesome! Click next!")
                    .font(.caption2)
                    .frame(height: 16)
                
                Spacer()
            }
            .navigationTitle("Personal Info")
            .navigationBarTitleDisplayMode(.inline)
            .background(.antiFlashWhite)
            .safeAreaInset(edge: .bottom) {
                NavigationLink {
                    ActivityLevelPage2()
                } label: {
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .hSpacing()
                        .frame(height: 50)
                        .background(Color("MaximumBlueGreen"), in: .rect(cornerRadius: 12))
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 16)
            }
            .searchable(text: $search)
        }
        
    }
}

#Preview {
    NavigationStack {
        AllergiesPage()
    }
}
