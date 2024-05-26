//
//  Dashboard.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 20/05/24.
//

import SwiftUI
import SwiftData

struct Dashboard: View {
    
    @Environment(\.modelContext) private var context
    
    @AppStorage(KEY_USERNAME)
    var userName: String = ""
    
    @AppStorage(KEY_BIRTHDATE)
    var storedBirthDate = Date.now.timeIntervalSinceReferenceDate
    
    var birthDate: Date {
        set {storedBirthDate = newValue.timeIntervalSinceReferenceDate}
        get {Date(timeIntervalSinceReferenceDate: storedBirthDate)}
    }
    
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
    
    @AppStorage(KEY_ALLERGIES)
    var allergies: [Ingredient] = []
    
    @AppStorage(KEY_DISLIKES)
    var dislikes: [Ingredient] = []
    
    @State var removedIngredients: [Ingredient] = []
    
    @State var calorieProgress: CGFloat = 0.9
    @State var startAnimation: CGFloat = 0
    
    @State var calorieCondition: CalorieCondition = .under
    
    @State var moveToProteinPage: Bool = false
    @State var moveToFatPage: Bool = false
    @State var moveToCarbPage: Bool = false
    @State var moveToFiberPage: Bool = false
    
    @ObservedObject var intakeViewModel: IntakeViewModel
    
    @State var isShowInformationPage = false
    
    @State var isShowPopup = false
    
    var day = CGFloat(1)
    
    @Query var challenges: [Challenge]
    
    @Query var dailyIntakes: [DailyIntake]
    
    @State var todaysIntake: [DailyIntake] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { proxy in
                    Image(.bgDashboard)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(
                            backgroundColorTop(condition: calorieCondition)
                        )
                        .scaledToFit()
                        .frame(width: proxy.size.width)
                        .ignoresSafeArea()
                }
                
                
                VStack {
                    
                    HStack(alignment: .center) {
                        
                        NavigationLink {
                            RecapPage(
                                isChallengeComplete: isChallengeComplete(),
                                intakeViewModel: intakeViewModel
                            )
                        } label: {
                            Text("Day \(Int(intakeViewModel.latestChallenge.day))")
                                .foregroundStyle(.raisinBlack)
                                .frame(width: 116)
                                .padding(6)
                                .background(
                                    .antiFlashWhite,
                                    in: .rect(cornerRadius: 12)
                                )
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            ProfilePage(
                                intakeViewModel: intakeViewModel
                            )
                        } label: {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 18, height: 18)
                        }
                        .foregroundStyle(.blue)
                        .frame(width: 34, height: 34)
                        .padding(6)
                        .background(
                            .antiFlashWhite,
                            in: .rect(cornerRadius: 24)
                        )
                        
                    }
                    
                    Text("\(Int(intakeViewModel.consumedDailyCalorie)) kCal")
                        .fontWeight(.heavy)
                        .font(.system(size: 48))
                        .foregroundColor(.white)
                        .shadow(color: .raisinBlack, radius: 5, y: 3)
                        .padding(.top, 24)
                    
                    Text("\(Int(calorieProgress * 100))% of your daily calories (\(Int(intakeViewModel.latestChallenge.dailyNutrition.calorie)) kCal)")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(16)
                
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    ZStack {
                        
                        if calorieCondition == .complete {
                            Image("monster_complete_gray")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else if calorieCondition == .over {
                            Image("monster_full_gray")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else {
                            Image("monster_gray")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        VStack {
                            if calorieCondition == .complete {
                                Image("monster_complete")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else if calorieCondition == .over {
                                Image("monster_full")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                Image("monster")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        .mask {
                            WaterWave(progress: calorieProgress, waveHeight: 0.015, offset: startAnimation)
                        }
                    }
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .onAppear {
                        if !(calorieProgress == 0.0 || calorieProgress >= 1.0) {
                            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                                startAnimation = size.width - 30
                            }
                        }
                    }
                    .onChange(of: calorieProgress) {
                        if !(calorieProgress == 0.0 || calorieProgress >= 1.0) {
                            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                                startAnimation = size.width - 30
                            }
                        }
                    }
                }
                .frame(height: 300)
                
                VStack {
                    Spacer()
                    
                    Button {
                        isShowInformationPage.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 22, height: 22)
                    }
                    .foregroundStyle(.blue)
                    .frame(width: 34, height: 34)
                    .padding(6)
                    .background(
                        .antiFlashWhite,
                        in: .rect(cornerRadius: 24)
                    )
                    .hSpacing(.bottomTrailing)
                    .padding(.trailing, 16)
                    .padding(.bottom, 8)
                    
                    HStack {
                        NutritionButton(
                            consumedNutritionCalorie: $intakeViewModel.consumedProtein,
                            nutritionType: NutritionType.protein,
                            totalNutritionCalorie: intakeViewModel.latestChallenge.dailyNutrition.protein,
                            intakeViewModel: intakeViewModel
                        )
                        .onTapGesture {
                            checkCalorieCondition()
                            moveToProteinPage.toggle()
                        }
                        .navigationDestination(isPresented: $moveToProteinPage) {
                            IngredientsPage(
                                selectedNutrient: NutritionType.protein.rawValue,
                                intakeViewModel: intakeViewModel
                            )
                        }
                        
                        NutritionButton(
                            consumedNutritionCalorie: $intakeViewModel.consumedFat,
                            nutritionType: NutritionType.fat,
                            totalNutritionCalorie: intakeViewModel.latestChallenge.dailyNutrition.fat,
                            intakeViewModel: intakeViewModel
                        )
                        .onTapGesture {
                            checkCalorieCondition()
                            moveToFatPage.toggle()
                        }
                        .navigationDestination(isPresented: $moveToFatPage) {
                            IngredientsPage(
                                selectedNutrient: NutritionType.fat.rawValue,
                                intakeViewModel: intakeViewModel
                            )
                        }
                        
                        NutritionButton(
                            consumedNutritionCalorie: $intakeViewModel.consumedCarb,
                            nutritionType: NutritionType.carb,
                            totalNutritionCalorie: intakeViewModel.latestChallenge.dailyNutrition.carb,
                            intakeViewModel: intakeViewModel
                        )
                        .onTapGesture {
                            checkCalorieCondition()
                            moveToCarbPage.toggle()
                        }
                        .navigationDestination(isPresented: $moveToCarbPage) {
                            IngredientsPage(
                                selectedNutrient: NutritionType.carb.rawValue,
                                intakeViewModel: intakeViewModel
                            )
                        }
                        
                        NutritionButton(
                            consumedNutritionCalorie: $intakeViewModel.consumedFiber,
                            nutritionType: NutritionType.fiber,
                            totalNutritionCalorie: 1,
                            intakeViewModel: intakeViewModel
                        )
                        .onTapGesture {
                            checkCalorieCondition()
                            moveToFiberPage.toggle()
                        }
                        .navigationDestination(isPresented: $moveToFiberPage) {
                            IngredientsPage(
                                selectedNutrient: NutritionType.fiber.rawValue,
                                intakeViewModel: intakeViewModel
                            )
                        }
                    }
                    .padding(.horizontal, 18)
                    .frame(height: 185)
                    .background(
                        .antiFlashWhite,
                        in: .rect(cornerRadius: 16)
                    )
                    
                    
                }
                .ignoresSafeArea()
                
                if isShowPopup {
                    CustomDialog(
                        isActive: $isShowPopup,
                        calorieCondition: .complete,
                        message: "Congrats on completing the challenge. You’ve boosted your gut health. Now, for an even better balance, don’t forget to meet your daily calorie needs!",
                        buttonTitle: "That’s for Today",
                        isMovePage : true
                    ) {
                        RecapPage(
                            isChallengeComplete: isChallengeComplete(),
                            intakeViewModel: intakeViewModel
                        )
                    }
                    .zIndex(999999)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                backgroundColorBottom(condition: calorieCondition)
            )
        }
        .onAppear {
            if !challenges.isEmpty {
                let latestStoredChallenge = challenges.last!
                
                let difference = differeceDay(from: latestStoredChallenge.challengeDate)
                
                if difference == 0 {
                    intakeViewModel.latestChallenge = latestStoredChallenge
                    
                    todaysIntake = dailyIntakes.filter {
                        $0.challenge?.identifier == latestStoredChallenge.identifier
                    }
                    
                    for intake in todaysIntake {
                        intakeViewModel.consumedDailyCalorie += intake.consumableNutrition.calorie
                        intakeViewModel.consumedProtein += intake.consumableNutrition.protein
                        intakeViewModel.consumedFat += intake.consumableNutrition.fat
                        intakeViewModel.consumedCarb += intake.consumableNutrition.carb
                        intakeViewModel.consumedFiber += intake.consumableNutrition.fiber
                    }
                    
                } else if difference == 1 {
                    if latestStoredChallenge.isComplete {
                        let newChallenge = Challenge(
                            identifier: UUID().uuidString,
                            challengeDate: Date(),
                            day: latestStoredChallenge.day + 1,
                            dailyNutrition: latestStoredChallenge.dailyNutrition,
                            dailyNutritionLimit: latestStoredChallenge.dailyNutritionLimit,
                            isComplete: false
                        )
                        
                        context.insert(newChallenge)
                        intakeViewModel.latestChallenge = challenges.last!
                    } else {
                        resetStreak(latestStoredChallenge: latestStoredChallenge)
                    }
                    try? context.save()
                    
                } else {
                    resetStreak(latestStoredChallenge: latestStoredChallenge)
                }
            }
            
            checkCalorieCondition()
            
            removedIngredients = allergies + dislikes
            
            intakeViewModel.filteredIngredients = intakeViewModel.filteredIngredients
                .filter { !removedIngredients.contains($0) }
        }
        .onChange(of: dailyIntakes) {
            todaysIntake = dailyIntakes.filter {
                $0.challenge?.identifier == intakeViewModel.latestChallenge.identifier
            }
        }
        .onChange(of: intakeViewModel.consumedDailyCalorie) {
            checkCalorieCondition()
        }
        .onChange(of: intakeViewModel.calorieProgress) {
            self.calorieProgress = intakeViewModel.calorieProgress
        }
        .sheet(isPresented: $isShowInformationPage) {
            InformationPage()
        }
        
    }
    
    private func checkCalorieCondition() {
        if intakeViewModel.latestChallenge.dailyNutrition.calorie == .zero {
            calorieProgress = 0.0
        } else {
            calorieProgress = CGFloat(intakeViewModel.consumedDailyCalorie) / CGFloat(intakeViewModel.latestChallenge.dailyNutrition.calorie)
        }
        
        if calorieProgress > 1 {
            calorieCondition = .over
        } else if calorieProgress >= 0.75 {
            
            if isChallengeComplete() {
                calorieCondition = .complete
                
                intakeViewModel.latestChallenge.isComplete = true
                try? context.save()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isShowPopup.toggle()
                }
            } else {
                calorieCondition = .full
            }
        } else {
            calorieCondition = .under
        }
    }
    
    private func isChallengeComplete() -> Bool {
        return checkIsChallengeComplete(
            consumedCalorie: (
                protein: intakeViewModel.consumedProtein,
                fat: intakeViewModel.consumedFat,
                carb: intakeViewModel.consumedCarb,
                fiber: intakeViewModel.consumedFiber
            ),
            minimumCalorie: (
                protein: getTotalMinimumCalorieLimit(
                    totalCalorie: intakeViewModel.latestChallenge.dailyNutritionLimit.protein,
                    nutritionType: .protein
                ).minimumCalorie,
                fat: getTotalMinimumCalorieLimit(
                    totalCalorie: intakeViewModel.latestChallenge.dailyNutritionLimit.fat,
                    nutritionType: .fat
                ).minimumCalorie,
                carb: getTotalMinimumCalorieLimit(
                    totalCalorie: intakeViewModel.latestChallenge.dailyNutritionLimit.carb,
                    nutritionType: .carb
                ).minimumCalorie,
                fiber: getTotalMinimumCalorieLimit(
                    totalCalorie: intakeViewModel.latestChallenge.dailyNutritionLimit.fiber,
                    nutritionType: .fiber
                ).minimumCalorie
            )
        )
    }
    
    private func resetStreak(latestStoredChallenge: Challenge) {
        do {
            try context.delete(model: Challenge.self)
            try context.delete(model: DailyIntake.self)
            
            let newChallenge = Challenge(
                identifier: UUID().uuidString,
                challengeDate: Date(),
                day: 1,
                dailyNutrition: latestStoredChallenge.dailyNutrition,
                dailyNutritionLimit: latestStoredChallenge.dailyNutritionLimit,
                isComplete: false
            )
            
            context.insert(newChallenge)
            try? context.save()
            
            intakeViewModel.latestChallenge = challenges.last!
        } catch {
            print("Failed to clear all Country and City data.")
        }
    }
}

#Preview {
    Dashboard(intakeViewModel: IntakeViewModel())
}
