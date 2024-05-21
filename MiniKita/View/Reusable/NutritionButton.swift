//
//  NutritionButton.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 21/05/24.
//

import SwiftUI

struct NutritionButton: View {
    
    @Binding var progress: CGFloat
    @State var startAnimation: CGFloat = 0
    
    var nutritionName: String = "Carb"
    
    var body: some View {
        
        VStack {
            Text(nutritionName)
            
            GeometryReader { proxy in
                let size = proxy.size
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.platinum)
                        .frame(width: 76, height: 76)
                        
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.maximumBlueGreen)
                        .mask {
                            WaterWave(progress: progress, waveHeight: 0.015, offset: startAnimation)
                                .frame(width: 80)
                        }
                    
                    
                    VStack {
                        Image(nutritionName.lowercased())
                            .resizable()
                            .frame(width: 53, height: 53)
                    }
                    .frame(width: 76, height: 76)
                }
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        startAnimation = size.width + 275
                    }
                }
            }
            .frame(width: 76, height: 76)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    NutritionButton(
        progress: .constant(0.35),
        nutritionName: "Protein"
    )
}
