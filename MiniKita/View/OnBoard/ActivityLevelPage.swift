//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct ActivityLevelPage: View {
    @State private var selectedActivity : ActivityLevel = .other
    
    var body: some View {
        VStack {
            ProgressBar(
                progress: 2/6,
                height: 4,
                foregroundColor: .maximumBlueGreen
            )
            .padding(.horizontal, 16)
            .padding(.top, 1)
            .frame(height: 1)
            
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
                    ForEach(ActivityLevel.allCases, id: \.self) { activity in
                        
                        if !(activity == .other) {
                            LongButtonHighlight(
                                label: activity.rawValue,
                                buttonColor: (activity == selectedActivity) ?
                                Color("CarrotOrange") : Color("GhostWhite"),
                                textColor: (activity == selectedActivity) ?
                                Color("AntiFlashWhite") : Color("RaisinBlack"),
                                action: {
                                    selectedActivity = activity
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
    }
}

#Preview {
    NavigationStack {
        ActivityLevelPage()
    }
}
