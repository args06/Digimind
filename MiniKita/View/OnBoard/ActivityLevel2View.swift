//
//  ActivityLevelNeverView.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 22/05/24.
//

import SwiftUI

struct ActivityLevel2View: View {
    @EnvironmentObject var model: OnboardingViewModel
    
    var body: some View {
        ScrollView {
            VStack {
//                Text("Workout Info")
//                    .font(.title)
//                    .padding(.top)
                workoutSection
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    var workoutSection: some View {
        VStack(alignment: .leading) {
            // Headline
            Text("And when you do get moving, how long do those sessions usually last?")
              .font(
                Font.custom("SF Pro", size: 17)
                  .weight(.semibold)
              )
              .foregroundColor(.black)
              .frame(width: 358, alignment: .topLeading)
            
            VStack(alignment: .leading) {
                ForEach(0..<self.model.activelyMove2.count, id: \.self) { index in
                    RoundedRectangleButton(title: model.activelyMove2[index], type: self.model.selectedActivelyMove2Type, index: index, action: {
                        self.model.selectedActivelyMove2Type = index
                    })
                }
            }
        }
        .padding(15)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(15)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
    }
    
}

struct ActivityLevel2_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLevel2View()
            .environmentObject(OnboardingViewModel())
    }
}
