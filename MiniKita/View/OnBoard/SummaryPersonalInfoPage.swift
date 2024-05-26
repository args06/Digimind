//
//  SummaryPersonalInfoPage.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 26/05/24.
//

import SwiftUI
import SwiftData

struct SummaryPersonalInfoPage: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) private var context
    
    @AppStorage(KEY_ONBOARD)
    var isOnBoardDone: Bool = false
    
    @AppStorage(KEY_USERNAME)
    var userName: String = ""
    
    @AppStorage(KEY_BIRTHDATE)
    var storedBirthDate = Date.now.timeIntervalSinceReferenceDate
    
    @AppStorage(KEY_AGE)
    var age: Int = 0
    
    @AppStorage(KEY_WEIGHT)
    var weight: Int = 0
    
    @AppStorage(KEY_HEIGHT)
    var height: Int = 0
    
    @AppStorage(KEY_GENDER)
    var gender: Gender = .male
    
    @AppStorage(KEY_ACTIVITY_LEVEL)
    var activityLevel: ActivityLevel = .sedentary
    
    @ObservedObject var intakeViewModel: IntakeViewModel
    
    @State var totalCalorie = 0.0
    
    @State var dailyNutrient = (protein: 0.0, fat: 0.0, carb: 0.0, fiber: 0.0)
    
    @State var carbsLimit = (minimumCalorie: 0.0, minimumPercentage: 0.0)
    @State var proteinLimit = (minimumCalorie: 0.0, minimumPercentage: 0.0)
    @State var fatLimit = (minimumCalorie: 0.0, minimumPercentage: 0.0)
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Image(.calorie)
                        .resizable()
                        .scaledToFit()
                        .padding(15)
                        .frame(width: 110)
                        .shadow(color: .alloyOrange, radius: 13)
                    Text("Hey \(userName), \n Welcome aboard!")
                        .fontWeight(.semibold)
                        .font(.system(size: 24))
                        .foregroundStyle(.antiFlashWhite)
                        .multilineTextAlignment(.center)
                        
                    Text("\(userName), this challenge is tailored just for you. Your energy needs are perfectly matched to keep you fueled and ready to go!")
                        .fontWeight(.regular)
                        .font(.subheadline)
                        .foregroundStyle(.antiFlashWhite)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,24)
                        .padding(.top,18)
                    
                    Divider()
                        .frame(width: 327)
                        .frame(minHeight: 1.3)
                        .background(Color.antiFlashWhite)
                        .padding(.top,32)
                        .padding(.bottom,18)
                    
                    Text("Your daily calorie needs")
                        .fontWeight(.medium)
                        .font(.footnote)
                        .foregroundStyle(.antiFlashWhite)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,24)
                        .padding(.bottom,20)
                    
                    HStack{
                        Image(systemName: "fork.knife")
                            .foregroundColor(.carrotOrange)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("\(Int(totalCalorie)) kCal")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                            .foregroundStyle(.antiFlashWhite)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom,18)
                    
                    HStack(spacing : 32){
                        VStack{
                            Text("\(Int(proteinLimit.minimumCalorie)) kCal")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(NutritionType.protein.rawValue)
                                .font(.body)
                                .fontWeight(.semibold)
                        }
                        VStack{
                            Text("\(Int(carbsLimit.minimumCalorie)) kCal")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(NutritionType.carb.rawValue)
                                .font(.body)
                                .fontWeight(.semibold)
                        }
                        VStack{
                            Text("\(Int(fatLimit.minimumCalorie)) kCal")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(NutritionType.fat.rawValue)
                                .font(.body)
                                .fontWeight(.semibold)
                        }
                    }
                    .foregroundColor(.platinum)
                    .padding(.bottom,25)
                    
                    Divider()
                        .frame(width: 327)
                        .frame(minHeight: 1.3)
                        .background(Color.antiFlashWhite)
                        .padding(.top,10)
                        .padding(.bottom,18)
                    
                    Text("These results are crafted just for you, based on your physical info and activity level!")
                        .fontWeight(.medium)
                        .font(.footnote)
                        .foregroundStyle(.antiFlashWhite)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,24)
                        .padding(.bottom,20)
                    
                    HStack(spacing : 48){
                        VStack{
                            Image(systemName: "scalemass")
                                .foregroundColor(.antiFlashWhite)
                                .font(.title)
                                .fontWeight(.regular)
                                .frame(height: 27)
                            Text("\(weight) kg")
                                .font(.body)
                                .fontWeight(.regular)
                        }
                        VStack{
                            Image(systemName: "birthday.cake")
                                .foregroundColor(.antiFlashWhite)
                                .font(.title)
                                .fontWeight(.regular)
                                .frame(height: 27)
                            Text("\(age) yo")
                                .font(.body)
                                .fontWeight(.regular)
                        }
                        VStack{
                            Image(systemName: "person")
                                .foregroundColor(.antiFlashWhite)
                                .font(.title)
                                .fontWeight(.regular)
                                .frame(height: 27)
                            Text("\(gender.rawValue)")
                                .font(.body)
                                .fontWeight(.regular)
                        }
                        VStack{
                            Image(systemName: "ruler")
                                .foregroundColor(.antiFlashWhite)
                                .font(.title)
                                .fontWeight(.regular)
                                .frame(height: 27)
                            Text("\(height) cm")
                                .font(.body)
                                .fontWeight(.regular)
                        }
                    }
                    .foregroundColor(.platinum)
                    .padding(.bottom,32)
                }
                .onAppear{
                    totalCalorie = calculateTotalCalorie(weight: weight, height: height, age: age, gender: gender, activityLevel: activityLevel)
                    
                    dailyNutrient = calculateDailyNutrient(totalCalorie: Double(totalCalorie))
                    
                    proteinLimit = getTotalMinimumCalorieLimit(
                        totalCalorie: dailyNutrient.protein,
                        nutritionType: .protein
                    )
                    
                    carbsLimit = getTotalMinimumCalorieLimit(
                        totalCalorie: dailyNutrient.carb,
                        nutritionType: .carb
                    )
                    
                    fatLimit = getTotalMinimumCalorieLimit(
                        totalCalorie: dailyNutrient.fat,
                        nutritionType: .fat
                    )
                }
                .safeAreaInset(edge: .bottom) {
                    
                    LongButton(
                        label: "Start Challenge",
                        buttonColor: .peachOrange,
                        textColor: .raisinBlack
                    ) {
                        isOnBoardDone = true
                        
                        let newChallenge = Challenge(
                            identifier: UUID().uuidString,
                            challengeDate: Date(),
                            day: 1,
                            dailyNutrition: NutritionInfo(
                                calorie: totalCalorie,
                                protein: dailyNutrient.protein,
                                fat: dailyNutrient.fat,
                                carb: dailyNutrient.carb,
                                fiber: 1
                            ),
                            dailyNutritionLimit: NutritionInfo(
                                calorie: totalCalorie,
                                protein: proteinLimit.minimumCalorie,
                                fat: fatLimit.minimumCalorie,
                                carb: carbsLimit.minimumCalorie,
                                fiber: 1
                            ),
                            isComplete: false
                        )
                        
                        context.insert(newChallenge)
                        try? context.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 16)
                }
            }
            .allSpacing()
            .background(Color.maximumBlueGreen)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    SummaryPersonalInfoPage(intakeViewModel: IntakeViewModel())
}
