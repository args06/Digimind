//
//  ProfilePage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct ProfilePage: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) private var context
    
    @AppStorage(KEY_USERNAME)
    var userName: String = ""
    
    @AppStorage(KEY_BIRTHDATE)
    var storedBirthDate = Date.now.timeIntervalSinceReferenceDate
    
    @State var dateOfBirth: Date = Date()
    
    @AppStorage(KEY_AGE)
    var age: Int = 0
    
    @AppStorage(KEY_WEIGHT)
    var weight: Int = 0
    
    @AppStorage(KEY_HEIGHT)
    var height: Int = 0
    
    @AppStorage(KEY_GENDER)
    var gender: Gender = .female
    
    @AppStorage(KEY_ACTIVITY_LEVEL)
    var activityLevel: ActivityLevel = .sedentary
    
    @AppStorage(KEY_ALLERGIES)
    var allergies: [Ingredient] = []
    
    @AppStorage(KEY_DISLIKES)
    var dislikes: [Ingredient] = []
    
    @ObservedObject var intakeViewModel: IntakeViewModel
    
    var body: some View {
        
        var birthDate: Date {
            set {storedBirthDate = newValue.timeIntervalSinceReferenceDate}
            get {Date(timeIntervalSinceReferenceDate: storedBirthDate)}
        }
        
        VStack {
            Form {
                DetailInformation(
                    informationType: .inputText,
                    informationName: "Nickname",
                    informationValue: $userName,
                    informationValueInt: .constant(0),
                    inputTextPosition: .leading
                )
                
                Section {
                    DatePicker(selection: $dateOfBirth, in: ...Date.now, displayedComponents: .date) {
                        Text("Birthdate")
                    }
                    
                    DetailInformation(
                        informationType: .inputText,
                        isInputInt: true,
                        informationName: "Weight",
                        informationValue: .constant(""),
                        informationValueInt: $weight,
                        additionalInformation: "kg"
                    )
                    
                    DetailInformation(
                        informationType: .inputText,
                        isInputInt: true,
                        informationName: "Height",
                        informationValue: .constant(""),
                        informationValueInt: $height,
                        additionalInformation: "cm"
                    )
                    
                    Picker("Gender", selection: $gender) {
                        ForEach(Gender.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    
                    NavigationLink {
                        ActivityLevelPage(
                            isFromProfile: true,
                            intakeViewModel: intakeViewModel
                        )
                    } label: {
                        DetailInformation(
                            informationType: .text,
                            informationName: "Activity Level",
                            informationValue: .constant(""),
                            informationValueInt: .constant(0),
                            additionalInformation: activityLevel.rawValue
                        )
                    }
                    
                } header: {
                    Text("Personal Information")
                        .textCase(nil)
                }
                
                Section {
                    NavigationLink {
                        AllergiesPage(
                            isFromProfile: true, 
                            intakeViewModel: intakeViewModel
                        )
                    } label: {
                        DetailInformation(
                            informationType: .text,
                            informationName: "Allergies",
                            informationValue: .constant(""),
                            informationValueInt: .constant(0),
                            additionalInformation: "Edit",
                            isHaveDetail: true,
                            detailInformation: allergies.map {$0.ingredientName}
                        )
                    }
                    
                    NavigationLink {
                        DislikePage(
                            isFromProfile: true,
                            intakeViewModel: intakeViewModel
                        )
                    } label: {
                        DetailInformation(
                            informationType: .text,
                            informationName: "Dislikes",
                            informationValue: .constant(""),
                            informationValueInt: .constant(0),
                            additionalInformation: "Edit",
                            isHaveDetail: true,
                            detailInformation: dislikes.map {$0.ingredientName}
                        )
                    }
                    
                } header: {
                    Text("Allergies & Dislikes")
                        .textCase(nil)
                }
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        DetailInformation(
                            informationType: .text,
                            informationName: "Apple Health",
                            informationValue: .constant(""),
                            informationValueInt: .constant(0),
                            additionalInformation: "Off",
                            isHaveDetail: false,
                            detailInformation: []
                        )
                    }
                    
                } header: {
                    Text("Apple Health (Next Development)")
                        .textCase(nil)
                }
                .disabled(true)
            }
        }
        .navigationTitle("Personal Info")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            dateOfBirth = Date(timeIntervalSinceReferenceDate: storedBirthDate)
        }
        .onChange(of: dateOfBirth) {
            birthDate = dateOfBirth
            age = calculateAge(birthDate: birthDate)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                
                Button("Done") {
                    let totalCalorie = calculateTotalCalorie(weight: weight, height: height, age: age, gender: gender, activityLevel: activityLevel)
                    
                    let dailyNutrient = calculateDailyNutrient(totalCalorie: Double(totalCalorie))
                    
                    let proteinLimit = getTotalMinimumCalorieLimit(
                        totalCalorie: dailyNutrient.protein,
                        nutritionType: .protein
                    )
                    
                    let carbsLimit = getTotalMinimumCalorieLimit(
                        totalCalorie: dailyNutrient.carb,
                        nutritionType: .carb
                    )
                    
                    let fatLimit = getTotalMinimumCalorieLimit(
                        totalCalorie: dailyNutrient.fat,
                        nutritionType: .fat
                    )
                    
                    intakeViewModel.latestChallenge.dailyNutrition.calorie = totalCalorie
                    intakeViewModel.latestChallenge.dailyNutrition.protein = dailyNutrient.protein
                    intakeViewModel.latestChallenge.dailyNutrition.fat = dailyNutrient.fat
                    intakeViewModel.latestChallenge.dailyNutrition.carb = dailyNutrient.carb
                    intakeViewModel.latestChallenge.dailyNutrition.fiber = dailyNutrient.fiber
                    
                    intakeViewModel.latestChallenge.dailyNutritionLimit.calorie = totalCalorie
                    intakeViewModel.latestChallenge.dailyNutritionLimit.protein = proteinLimit.minimumCalorie
                    intakeViewModel.latestChallenge.dailyNutritionLimit.fat = fatLimit.minimumCalorie
                    intakeViewModel.latestChallenge.dailyNutritionLimit.carb = carbsLimit.minimumCalorie
                    intakeViewModel.latestChallenge.dailyNutritionLimit.fiber = 1
                    
                    intakeViewModel.calorieProgress = CGFloat(intakeViewModel.consumedDailyCalorie) / CGFloat(intakeViewModel.latestChallenge.dailyNutrition.calorie)
                    
                    try? context.save()
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfilePage(intakeViewModel: IntakeViewModel())
    }
}
