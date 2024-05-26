//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct PersonalInfoPage: View {
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
        VStack {
            ProgressBar(
                progress: 1/6,
                height: 4,
                foregroundColor: .maximumBlueGreen
            )
            .padding(.horizontal, 16)
            .padding(.top, 1)
            .frame(height: 1)
            
            Form {
                
                Section{
                    DetailInformation(
                        informationType: .inputText,
                        informationName: "Nickname",
                        informationValue: $userName,
                        informationValueInt: .constant(0),
                        inputTextPosition: .leading
                    )
                }header: {
                    Text("Enter the name you would like to go by,")
                        .textCase(nil)
                }
                
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
                } header: {
                    Text("Personal Information")
                        .textCase(nil)
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 400)
            
            HStack {
                VStack{
                    Image("ngintip")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 100,maxHeight: 100,alignment: .leading)
                        .listRowInsets(EdgeInsets())
                }.frame(width: 100)
                
                ZStack {
                    SpeechBubble()
                        .fill(.ghostWhite)
                        .stroke(.platinum, lineWidth: 1.5)
                        .shadow(color : .platinum,radius: 2, x : 0, y:5.22)
                    
                    Text("don’t worry, your data will never leave this device")
                        .padding(5)
                        .foregroundColor(.graniteGray)
                    
                }
                .frame(width: 210, height: 80)
                
            }
            .hSpacing(.leading)
            .vSpacing()
            .listRowBackground(Color("AntiFlashWhite"))
            
        }
        .navigationTitle("Personal Info")
        .navigationBarTitleDisplayMode(.inline)
        .background(.antiFlashWhite)
        .safeAreaInset(edge: .bottom) {
            NavigationLink {
                ActivityLevelPage()
                
            } label: {
                Text("Next")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .hSpacing()
                    .frame(height: 50)
                    .background(Color("MaximumBlueGreen"), in: .rect(cornerRadius: 12))
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    NavigationStack {
        PersonalInfoPage()
    }
}
