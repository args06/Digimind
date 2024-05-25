//
//  SwiftUIView4.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import SwiftUI

struct IngredientAmountPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var navigateToNextPage = false
    @State var progress: CGFloat = 0.6
    
    @State var selectedAmount = FoodUnits(value: 1, unit: .gram)
    @State var isPickerVisible = false
    
    @State var selectedNutritionInfo = NutritionInfo()
    @State var calorieResult = (calorie: 0.0, protein: 0.0, fat: 0.0, carb: 0.0, fiber: 0.0)
    
    @ObservedObject var intakeViewModel : IntakeViewModel

    
    var body: some View {
        NavigationStack{
            VStack{
                Text("How much do you eat?")
                
                Form {
                    Section {
                        HStack {
                            Text(intakeViewModel.selectedPart.partName)
                            Spacer()
                            
                            Text("\(selectedAmount.value) \(selectedAmount.unit.rawValue)")
                                .frame(width: 130,height: 30)
                                .background(Color("AntiFlashWhite"))
                                .cornerRadius(8)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    withAnimation {
                                        isPickerVisible.toggle()
                                    }
                                }
                        }
                        .contentShape(Rectangle())
                        
                        if isPickerVisible {
                            FoodUnitsPicker(
                                selection: $selectedAmount,
                                values: Array(1..<350),
                                units: intakeViewModel.selectedIngredient.availableUnit
                            )
                        }
                    }
                    .frame(height: 50)
                    
                    VStack(alignment: .leading){
                        Text("Nutricions Fact")
                            .font(.callout)
                            .fontWeight(.medium)
                        
                        HStack(alignment: .center){
                            Text("\(decimalFormat(number: calorieResult.calorie)) kCal")
                                .font(.system(size: 24))
                                .fontWeight(.medium)
                            
                            ProgressBar(progress: progress, height: 4)
                                .frame(height: 10)
                                .padding(.top, 4)
                        }
                        
                        
                        Text("100% of your daily proteins (156 kCal)")
                            .hSpacing(.leading)
                            .font(.caption)
                    }
                    .padding(0)
                    .listRowBackground(Color("AntiFlashWhite"))
                    
                }
            }
        }
        .navigationTitle(intakeViewModel.selectedIngredient.ingredientName)
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.antiFlashWhite)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                
                Button("Done") {
                    intakeViewModel.consumedDailyCalorie += calorieResult.calorie
                    intakeViewModel.consumedProtein += (calorieResult.protein * 4)
                    intakeViewModel.consumedFat += (calorieResult.fat * 9)
                    intakeViewModel.consumedCarb += (calorieResult.carb * 4)
                    intakeViewModel.consumedFiber += calorieResult.fiber
                    self.presentationMode.wrappedValue.dismiss()
                    print("\(intakeViewModel.selectedIngredient.nutritionType.rawValue) : Protein : \(intakeViewModel.consumedProtein)")
                }
            }
        }
        .onAppear {
            calorieResult = getIngredientCalorie(
                selectedAmount: selectedAmount,
                selectedNutrition: intakeViewModel.selectedNutrition
            )
        }
        .onChange(of: selectedAmount) {
            calorieResult = getIngredientCalorie(
                selectedAmount: selectedAmount,
                selectedNutrition: intakeViewModel.selectedNutrition
            )
        }
    }
}

extension IngredientAmountPage {
    final class ViewModel: ObservableObject {
        @Published var selection = FoodUnits(value: 1, unit: .gram)
        @Published var isPickerVisible = false
    }
}


#Preview {
    NavigationStack {
        IngredientAmountPage(
            intakeViewModel: IntakeViewModel()
        )
    }
}
