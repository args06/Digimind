//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct ActivityLevelPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var selectedOften : ActivityOften = .other
    
    var isFromProfile: Bool = false
    
    @State var exitToProfile: Bool = false
    
    @ObservedObject var intakeViewModel: IntakeViewModel
    
    var body: some View {
        VStack {
            
            if !isFromProfile {
                ProgressBar(
                    progress: 2/6,
                    height: 4,
                    foregroundColor: .maximumBlueGreen
                )
                .padding(.horizontal, 16)
                .padding(.top, 1)
                .frame(height: 1)
            }
            
            VStack{
                Text("How often do you actively move or break a sweat?")
                    .font(.headline)
                    .frame(height: 44)
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible())
                    ],
                    spacing: 12
                ) {
                    ForEach(ActivityOften.allCases, id: \.self) { activity in
                        
                        if !(activity == .other) {
                            LongButtonHighlight(
                                label: activity.rawValue,
                                buttonColor: (activity == selectedOften) ?
                                Color("CarrotOrange") : Color("GhostWhite"),
                                textColor: (activity == selectedOften) ?
                                Color("AntiFlashWhite") : Color("RaisinBlack"),
                                action: {
                                    selectedOften = activity
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    }
                                }
                            )
                        }
                    }
                }
                .padding()
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Activity Level")
        .navigationBarTitleDisplayMode(.inline)
        .background(.antiFlashWhite)
        .safeAreaInset(edge: .bottom) {
            NavigationLink {
                ActivityLevelPage2(
                    selectedOften: selectedOften,
                    isFromProfile: isFromProfile,
                    exitToProfile: $exitToProfile,
                    intakeViewModel: intakeViewModel
                )
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
            .disabled(formValidation())
        }
        .onChange(of: exitToProfile) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func formValidation() -> Bool {
        return selectedOften == .other
    }
}

#Preview {
    NavigationStack {
        ActivityLevelPage(intakeViewModel: IntakeViewModel())
    }
}
