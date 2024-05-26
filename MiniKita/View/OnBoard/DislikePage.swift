//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct DislikePage: View {
    @State private var selectedDislike : [Ingredient] = []
    @State private var search : String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                
                ProgressBar(
                    progress: 6/6,
                    height: 4,
                    foregroundColor: .maximumBlueGreen
                )
                .padding(.horizontal, 16)
                .padding(.top, 1)
                .frame(height: 1)
                
                VStack{
                    Text("Got dislikes? Let us know to make your experience even better!")
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
                        ForEach(filterIngredients(query: search), id: \.self) { dislike in
                            LongButtonHighlight(
                                label: dislike.ingredientName,
                                buttonColor: (selectedDislike.contains(dislike)) ?
                                Color("CarrotOrange") : Color("GhostWhite"),
                                textColor: (selectedDislike.contains(dislike)) ?
                                Color("AntiFlashWhite") : Color("RaisinBlack"),
                                action: {
                                    if selectedDislike.contains(dislike) {
                                        let index = selectedDislike.firstIndex(of: dislike)
                                        selectedDislike.remove(at: index!)
                                    } else {
                                        selectedDislike.append(dislike)
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
                
                Spacer()
            }
            .navigationTitle("Personal Info")
            .navigationBarTitleDisplayMode(.inline)
            .background(.antiFlashWhite)
            .safeAreaInset(edge: .bottom) {
                NavigationLink {
                    ProcessingInfoPage()
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
        DislikePage()
    }
}
