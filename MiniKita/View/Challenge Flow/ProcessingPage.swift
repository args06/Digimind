//
//  SwiftUIView2.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import Foundation
import SwiftUI

struct ProcessingPage: View {
    
    @State private var selectedNutrition = Nutrition()
    @State private var navigateToNextPage = false
    
    @ObservedObject var intakeViewModel : IntakeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("How are you preparing your meals today?")
                        .font(.headline)
                        .padding(.bottom, 24)
                    
                    VStack {
                        ForEach(intakeViewModel.selectedPart.nutrition, id: \.self) { nutrition in
                            LongButton(
                                label: nutrition.cookingType,
                                buttonColor: (nutrition == selectedNutrition) ?
                                Color("CarrotOrange") : Color("GhostWhite"),
                                textColor: (nutrition == selectedNutrition) ?
                                Color("AntiFlashWhite") : Color("RaisinBlack"),
                                action: {
                                    selectedNutrition = nutrition
                                    intakeViewModel.selectedNutrition = selectedNutrition
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        navigateToNextPage = true
                                    }
                                }
                            )
                            .navigationDestination(
                                isPresented: $navigateToNextPage
                            ) {
                                IngredientAmountPage(intakeViewModel: intakeViewModel)
                            }
                        }
                    }
                    .padding(.bottom, 88)
                    
                    Text("Did you know? The less processed your food, the better it is for you! Whole foods pack more nutrients and fewer additives, making them the healthier choice for your body. 🌿🍎🍞")
                        .padding()
                        .foregroundColor(.graniteGray)
                        .background {
                            SpeechBubble2()
                                .fill(.ghostWhite)
                                .stroke(.platinum, lineWidth: 1.5)
                                .shadow(color : .platinum,radius: 2,x : 0, y:5.22)
                        }
                    
                    Image("monster")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 184)
                    
                }
                .padding(16)
            }
            .navigationTitle(intakeViewModel.selectedIngredient.ingredientName)
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.antiFlashWhite)
        }
    }
}


#Preview {
    NavigationStack {
        ProcessingPage(
            intakeViewModel: IntakeViewModel()
        )
    }
}
