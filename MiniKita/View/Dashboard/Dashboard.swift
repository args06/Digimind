//
//  Dashboard.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 20/05/24.
//

import SwiftUI

struct Dashboard: View {
    
    @State var totalCalorie: Int = 2150
    @State var consumedCalorie: Int = 2100
    
    @State var calorieProgress: CGFloat = 0.9
    @State var startAnimation: CGFloat = 0
    
    @State var proteinProgress: CGFloat = 0.6
    @State var fatProgress: CGFloat = 0.6
    @State var carbProgress: CGFloat = 0.6
    @State var fiberProgress: CGFloat = 0.6
    
    @State var calorieCondition: CalorieCondition = .under
    
    @State var moveToProteinPage: Bool = false
    @State var moveToFatPage: Bool = false
    @State var moveToCarbPage: Bool = false
    @State var moveToFiberPage: Bool = false
    
    var day = CGFloat(6)
    
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
                    
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Day \(Int(day))/7")
                                .foregroundStyle(.raisinBlack)
                                .frame(width: 116)
                                .padding(6)
                                .background(
                                    .antiFlashWhite,
                                    in: .rect(cornerRadius: 12)
                                )
                            ProgressBar(
                                progress: day/7,
                                height: 4,
                                foregroundColor: .antiFlashWhite
                            )
                                .frame(width: 128, height: 10)
                        }
                        
                        Spacer()
                        
                        Button("Info", systemImage: "info.circle") {
                            
                        }
                        .foregroundStyle(.antiFlashWhite)
                        
                    }
                    
                    Text("\(consumedCalorie) kCal")
                        .fontWeight(.heavy)
                        .font(.system(size: 48))
                        .foregroundColor(.white)
                        .shadow(color: .raisinBlack, radius: 5, y: 3)
                        .padding(.top, 24)
                    
                    Text("\(Int(calorieProgress * 100))% of your daily calories (\(totalCalorie) kCal)")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(16)
                
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    ZStack {
                        Image("monster_gray")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Image("monster")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .mask {
                                WaterWave(progress: calorieProgress, waveHeight: 0.015, offset: startAnimation)
                            }
                    }
                    .frame(width: size.width, height: size.height, alignment: .center)
                    .onAppear {
                        withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                            startAnimation = size.width - 30
                        }
                    }
                }
                .frame(height: 300)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        
                        NutritionButton(
                            progress: $proteinProgress,
                            nutritionName: "Protein"
                        )
                        .onTapGesture {
                            calorieProgress = CGFloat(consumedCalorie) / CGFloat(totalCalorie)
                            print(calorieProgress)
                            proteinProgress += 0.005
                            consumedCalorie += 5
                            
                            checkCalorieCondition()
                            moveToProteinPage.toggle()
                        }
                        .navigationDestination(isPresented: $moveToProteinPage) {
                            IngredientsPage(selectedNutrient: "Protein")
                        }
                        
                        NutritionButton(
                            progress: $fatProgress,
                            nutritionName: "Fat"
                        )
                        .onTapGesture {
                            calorieProgress = CGFloat(consumedCalorie) / CGFloat(totalCalorie)
                            print(calorieProgress)
                            fatProgress += 0.005
                            consumedCalorie += 5
                            
                            checkCalorieCondition()
                            moveToFatPage.toggle()
                        }
                        .navigationDestination(isPresented: $moveToFatPage) {
                            IngredientsPage(selectedNutrient: "Fat")
                        }
                        
                        NutritionButton(
                            progress: $carbProgress,
                            nutritionName: "Carb"
                        )
                        .onTapGesture {
                            calorieProgress = CGFloat(consumedCalorie) / CGFloat(totalCalorie)
                            print(calorieProgress)
                            carbProgress += 0.005
                            consumedCalorie += 5
                            
                            checkCalorieCondition()
                            moveToCarbPage.toggle()
                        }
                        .navigationDestination(isPresented: $moveToCarbPage) {
                            IngredientsPage(selectedNutrient: "Carb")
                        }
                        
                        NutritionButton(
                            progress: $fiberProgress,
                            nutritionName: "Fiber"
                        )
                        .onTapGesture {
                            calorieProgress = CGFloat(consumedCalorie) / CGFloat(totalCalorie)
                            print(calorieProgress)
                            fiberProgress += 0.005
                            consumedCalorie += 5
                            
                            checkCalorieCondition()
                            moveToFiberPage.toggle()
                        }
                        .navigationDestination(isPresented: $moveToFiberPage) {
                            IngredientsPage(selectedNutrient: "Fiber")
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
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                backgroundColorBottom(condition: calorieCondition)
            )
            .onAppear {
                calorieProgress = CGFloat(consumedCalorie) / CGFloat(totalCalorie)
                print(calorieProgress)
            }
        }
    }
    
    private func checkCalorieCondition() {
        if consumedCalorie == totalCalorie {
            calorieCondition = .full
        } else if consumedCalorie > totalCalorie {
            calorieCondition = .over
        } else {
            calorieCondition = .under
        }
    }
}

#Preview {
    Dashboard()
}
