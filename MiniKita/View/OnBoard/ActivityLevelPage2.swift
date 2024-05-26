//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct ActivityLevelPage2: View {
    @State private var selectedActivityMinute : ActivityMinute = .other
    
    var body: some View {
        VStack {
            ProgressBar(
                progress: 3/6,
                height: 4,
                foregroundColor: .maximumBlueGreen
            )
            .padding(.horizontal, 16)
            .padding(.top, 1)
            .frame(height: 1)
            
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
        ActivityLevelPage2()
    }
}
