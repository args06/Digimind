//
//  SplashScreen.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @AppStorage(KEY_USERNAME)
    var userName: String = "Anjar"
    
    @AppStorage(KEY_BIRTHDATE)
    var storedBirthDate = Date.now.timeIntervalSinceReferenceDate
    
    @AppStorage(KEY_AGE)
    var age: Int = 20
    
    @AppStorage(KEY_WEIGHT)
    var weight: Int = 20
    
    @AppStorage(KEY_HEIGHT)
    var height: Int = 20
    
    @AppStorage(KEY_GENDER)
    var gender: Gender = .female
    
    @AppStorage(KEY_ACTIVITY_LEVEL)
    var activityLevel: ActivityLevel = .sedentary
    
    @State var isActive = false
    
    var body: some View {
        var birthDate: Date {
            set {storedBirthDate = newValue.timeIntervalSinceReferenceDate}
            get {Date(timeIntervalSinceReferenceDate: storedBirthDate)}
        }
        
        VStack {
            if isActive {
                Dashboard()
            } else {
                VStack {
                    Image("splash")
                        .resizable()
                        .frame(width: 190, height: 144)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("JungleGreen"))
            }
        }
        .onAppear {
            userName = "Anjar Harimurti"
            birthDate = Date.from(year: 2001, month: 06, day: 26)
            
            age = calculateAge(birthDate: birthDate)
            weight = 70
            height = 168
            gender = .male
            activityLevel = defineActivityLevel(often: 3, minute: 2)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
