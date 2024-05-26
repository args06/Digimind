//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct ActivityLevelPage2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var selectedOften: ActivityOften
    @State private var selectedActivityMinute : ActivityMinute = .other
    
    @AppStorage(KEY_ACTIVITY_LEVEL)
    var activityLevel: ActivityLevel = .sedentary
    
    var isFromProfile: Bool = false
    
    @Binding var exitToProfile: Bool
    
    @ObservedObject var intakeViewModel: IntakeViewModel
    
    var body: some View {
        VStack {
            
            if !isFromProfile {
                ProgressBar(
                    progress: 3/6,
                    height: 4,
                    foregroundColor: .maximumBlueGreen
                )
                .padding(.horizontal, 16)
                .padding(.top, 1)
                .frame(height: 1)
            }
            
            
            VStack{
                Text("And when you do get moving, how long do those sessions usually last?")
                    .font(.headline)
                    .frame(height: 44)
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible())
                    ],
                    spacing: 12
                ) {
                    ForEach(ActivityMinute.allCases, id: \.self) { activity in
                        
                        if !(activity == .other) {
                            LongButtonHighlight(
                                label: activity.rawValue,
                                buttonColor: (activity == selectedActivityMinute) ?
                                Color("CarrotOrange") : Color("GhostWhite"),
                                textColor: (activity == selectedActivityMinute) ?
                                Color("AntiFlashWhite") : Color("RaisinBlack"),
                                action: {
                                    selectedActivityMinute = activity
                                    activityLevel = defineActivityLevel(often: selectedOften, minute: selectedActivityMinute)
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
            if !isFromProfile {
                NavigationLink {
                    ActivityLevelPage3(intakeViewModel: intakeViewModel)
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
            } else {
                LongButton(
                    label: "Save",
                    buttonColor: .maximumBlueGreen,
                    textColor: .white) {
                        
                        activityLevel = defineActivityLevel(often: selectedOften, minute: selectedActivityMinute)
                        
                        exitToProfile.toggle()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .padding(.horizontal, 16)
            }
        }
    }
    
    func formValidation() -> Bool {
        return selectedActivityMinute == .other
    }
}

#Preview {
    NavigationStack {
        ActivityLevelPage2(
            selectedOften: .casual,
            exitToProfile: .constant(true),
            intakeViewModel: IntakeViewModel()
        )
    }
}
