//
//  SwiftUIView4.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import SwiftUI

struct IngredientAmountPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) private var context
    
    @State private var navigateToNextPage = false
    @State var progress: CGFloat = 0.6
    
    @State var selectedAmount = FoodUnits(value: 1, unit: .gram)
    @State var isPickerVisible = false
    
    @State var selectedNutritionInfo = NutritionInfo()
    @State var calorieResult = (calorie: 0.0, protein: 0.0, fat: 0.0, carb: 0.0, fiber: 0.0)
    
    @ObservedObject var intakeViewModel : IntakeViewModel

    @State var isShowPopup = false
    
    var body: some View {
        NavigationStack{
            ZStack {
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
                        
                    }
                    
                    HStack {
                        Image(.ngintip)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 121)
                        
                        Spacer()
                        
                        ZStack {
                            SpeechBubble()
                                .fill(.ghostWhite)
                                .stroke(.platinum, lineWidth: 1.5)
                                .shadow(color : .platinum,radius: 2, x : 0, y:5.22)
                            
                            VStack(alignment: .leading) {
                                Text("Calories added by this choice:")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(.graniteGray)
                                
                                Text("\(decimalFormat(number: calorieResult.calorie)) kCal")
                                    .font(.system(size: 26))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .padding(.top, 4)
                                
                                Text("Nutrition Facts")
                                    .font(.callout)
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                
                                HStack {
                                    Text("\(NutritionType.protein.rawValue)")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Text("\(decimalFormat(number: calorieResult.protein)) g")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                }
                                .padding(.top, 8)
                                
                                HStack {
                                    Text("\(NutritionType.fat.rawValue)")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Text("\(decimalFormat(number: calorieResult.fat)) g")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                }
                                
                                HStack {
                                    Text("\(NutritionType.carb.rawValue)")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Text("\(decimalFormat(number: calorieResult.carb)) g")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                }
                                
                                HStack {
                                    Text("\(NutritionType.fiber.rawValue)")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Text("\(decimalFormat(number: calorieResult.fiber)) g")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                }
                                
                            }
                            .padding(16)
                            
                        }
                        
                        .padding(.trailing, 16)
                        .frame(height: 230)
                    }
                    .padding(.bottom, 128)
                    .listRowBackground(Color("AntiFlashWhite"))
                }
                
                if isShowPopup {
                    CustomDialog(
                        isActive: $isShowPopup,
                        isStopShow: .constant(true),
                        calorieCondition: .full,
                        message: "Eating more of this might push your calorie intake over your daily limit. Let's keep it balanced for a healthier you!",
                        buttonTitle: "Enough for Today",
                        isMovePage : false,
                        action: {
                            isShowPopup = false
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    ) {
                        EmptyView()
                    }
                    .zIndex(999999)
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
                    
                    if checkCalorie() {
                        isShowPopup = true
                    } else {
                        intakeViewModel.consumedDailyCalorie += calorieResult.calorie
                        intakeViewModel.consumedProtein += (calorieResult.protein * 4)
                        intakeViewModel.consumedFat += (calorieResult.fat * 9)
                        intakeViewModel.consumedCarb += (calorieResult.carb * 4)
                        intakeViewModel.consumedFiber += calorieResult.fiber
                        
                        print(intakeViewModel.selectedIngredient)
                        
                        let dailyIntake = DailyIntake(
                            identifier: UUID().uuidString,
                            ingredientName: intakeViewModel.selectedIngredient.ingredientName,
                            nutritionType: intakeViewModel.selectedIngredient.nutritionType,
                            ingredientPart: intakeViewModel.selectedPart.partName,
                            cookingType: intakeViewModel.selectedNutrition.cookingType,
                            consumableAmount: selectedAmount,
                            consumableNutrition: NutritionInfo(
                                calorie: calorieResult.calorie,
                                protein: (calorieResult.protein * 4),
                                fat: (calorieResult.fat * 9),
                                carb: (calorieResult.carb * 4),
                                fiber: calorieResult.fiber
                            ),
                            time: Date(),
                            challenge: intakeViewModel.latestChallenge
                        )
                        
                        context.insert(dailyIntake)
                        
                        try? context.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
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
    
    func checkCalorie() -> Bool {
        print(intakeViewModel.consumedCarb + calorieResult.carb)
        print(intakeViewModel.latestChallenge.dailyNutrition.carb)
        print(intakeViewModel.latestChallenge.dailyNutritionLimit.carb)
        
        return intakeViewModel.consumedDailyCalorie + calorieResult.calorie > intakeViewModel.latestChallenge.dailyNutrition.calorie
        || intakeViewModel.consumedProtein + calorieResult.protein > intakeViewModel.latestChallenge.dailyNutrition.protein
        || intakeViewModel.consumedFat + calorieResult.fat > intakeViewModel.latestChallenge.dailyNutrition.fat
        || intakeViewModel.consumedCarb + calorieResult.carb > intakeViewModel.latestChallenge.dailyNutrition.carb
    }
}

#Preview {
    NavigationStack {
        IngredientAmountPage(
            intakeViewModel: IntakeViewModel()
        )
    }
}
