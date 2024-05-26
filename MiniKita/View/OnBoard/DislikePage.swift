//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct DislikePage: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @AppStorage(KEY_DISLIKES)
    var dislikes: [Ingredient] = []
    
    @State private var selectedDislike : [Ingredient] = []
    @State private var search : String = ""
    
    var isFromProfile: Bool = false
    
    @ObservedObject var intakeViewModel: IntakeViewModel
    
    var body: some View {
        ScrollView{
            VStack {
                
                if !isFromProfile {
                    ProgressBar(
                        progress: 6/6,
                        height: 4,
                        foregroundColor: .maximumBlueGreen
                    )
                    .padding(.horizontal, 16)
                    .padding(.top, 1)
                    .frame(height: 1)
                }
                
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
                        ForEach(
                            filterIngredients(
                                query: search
                            ),
                            id: \.self
                        ) { dislike in
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
                                    
                                    dislikes = selectedDislike
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
            .navigationTitle("Dislikes")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom) {
                if !isFromProfile {
                    NavigationLink {
                        ProcessingInfoPage(intakeViewModel: intakeViewModel)
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
                } else {
                    LongButton(
                        label: "Save",
                        buttonColor: .maximumBlueGreen,
                        textColor: .white) {
                            intakeViewModel.filteredIngredients = intakeViewModel.filteredIngredients
                                .filter {
                                    !selectedDislike.contains($0)
                                }
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        .padding(.horizontal, 16)
                }
            }
            .searchable(text: $search)
            .onAppear {
                selectedDislike = dislikes
            }
        }
        .background(.antiFlashWhite)
    }
}

#Preview {
    NavigationStack {
        DislikePage(intakeViewModel: IntakeViewModel())
    }
}
