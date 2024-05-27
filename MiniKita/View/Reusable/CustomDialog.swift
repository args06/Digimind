//
//  CustomDialog.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct CustomDialog<Destination: View>: View {
    
    @Binding var isActive: Bool
    
    @Binding var isStopShow: Bool
    
    let calorieCondition: CalorieCondition
    let message: String
    let buttonTitle: String
    var isMovePage: Bool = false
    var action: () -> Void = {}
    
    @ViewBuilder var destination: Destination
    
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        ZStack {
            Color(.raisinBlack)
                .opacity(0.3)
                .onTapGesture {
                    closeDialog()
                }
            VStack {
                VStack {
                    if calorieCondition == .complete {
                        Image(.popupComplete)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .padding(.leading, 12)
                    } else if calorieCondition == .full {
                        Image(.popupFull)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 12)
                    }
                }
                .padding(.top, 16)
                
                
                VStack {
                    Text(message)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .fontWeight(.regular)
                    
                    if isMovePage {
                        NavigationLink {
                            destination
                        } label: {
                            Text(buttonTitle)
                                .foregroundStyle(.white)
                                .font(.headline)
                                .hSpacing()
                                .frame(height: 50)
                                .background(.blue, in: .rect(cornerRadius: 12))
                        }
                        .padding(.top, 30)
                    } else {
                        LongButton(
                            label: buttonTitle,
                            buttonColor: .blue,
                            textColor: .white,
                            action: action
                        )
                        .padding(.top, 30)
                    }
                    
                    
                }
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 12)
            .background(.antiFlashWhite)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            closeDialog()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title3)
                                .fontWeight(.medium)
                                .tint(.antiFlashWhite)
                                .padding(5)
                                .background(.blue)
                                .clipShape(Circle())
                        }
                    }
                    Spacer()
                }
                .padding(12)
            }
            .shadow(radius: 10)
            .padding(30)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
        
    
    func closeDialog() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
            isStopShow = false
        }
    }
}

#Preview {
    CustomDialog(
        isActive: .constant(true),
        isStopShow: .constant(true),
        calorieCondition: .complete,
        message: "Congrats on completing the challenge. You’ve boosted your gut health. Now, for an even better balance, don’t forget to meet your daily calorie needs!",
        buttonTitle: "That’s for Today",
        isMovePage: true ,
        action: {
            print("Hi")
        },
        destination: {
            RecapPage(
                isChallengeComplete: true,
                intakeViewModel: IntakeViewModel()
            )
        }
    )
    .previewLayout(.sizeThatFits)
}
