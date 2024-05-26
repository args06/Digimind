//
//  ProfilePage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct ProfilePage: View {
    
    @AppStorage(KEY_USERNAME)
    var userName: String = "Anjar"
    
    @AppStorage(KEY_BIRTHDATE)
    var storedBirthDate = Date.now.timeIntervalSinceReferenceDate
    
    @State var dateOfBirth: Date = Date()
    
    @AppStorage(KEY_AGE)
    var age: Int = 22
    
    @AppStorage(KEY_WEIGHT)
    var weight: Int = 20
    
    @AppStorage(KEY_HEIGHT)
    var height: Int = 20
    
    @AppStorage(KEY_GENDER)
    var gender: Gender = .female
    
    @AppStorage(KEY_ACTIVITY_LEVEL)
    var activityLevel: ActivityLevel = .sedentary
    
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
                        
                    } label: {
                        DetailInformation(
                            informationType: .text,
                            informationName: "Activity Level",
                            informationValue: .constant(""),
                            informationValueInt: .constant(0),
                            additionalInformation: "Edit"
                        )
                    }
                    
                } header: {
                    Text("Personal Information")
                        .textCase(nil)
                }
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        DetailInformation(
                            informationType: .text,
                            informationName: "Allergies",
                            informationValue: .constant(""),
                            informationValueInt: .constant(0),
                            additionalInformation: "Edit",
                            isHaveDetail: true,
                            detailInformation: []
                        )
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        DetailInformation(
                            informationType: .text,
                            informationName: "Dislikes",
                            informationValue: .constant(""),
                            informationValueInt: .constant(0),
                            additionalInformation: "Edit",
                            isHaveDetail: true,
                            detailInformation: ["Dairy", "Fish"]
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
                    Text("Apple Health")
                        .textCase(nil)
                }
            }
        }
        .navigationTitle("Personal Info")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            dateOfBirth = Date(timeIntervalSinceReferenceDate: storedBirthDate)
        }
        .onChange(of: dateOfBirth) {
            birthDate = dateOfBirth
        }
    }
}

#Preview {
    NavigationStack {
        ProfilePage()
    }
}
