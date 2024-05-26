//
//  WelcomePage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct ProcessingInfoPage: View {
    
    @State var startAnimation: CGFloat = 0
    @State private var moveClockwise = false
    @State var isActive = false
    
    var body: some View {
        VStack {
            if (!isActive){
                ZStack {
                    VStack {
                        Text("Processing...")
                            .fontWeight(.semibold)
                            .font(.system(size: 32))
                            .foregroundStyle(.carrotOrange)
                            .frame(width: 300)
                        
                        Text("Hang tight! We're calculating your perfect calorie count with help from your gut's microbiome crew!")
                            .multilineTextAlignment(.center)
                            .font(.subheadline)
                            .frame(width: 300)
                        
                        Image(.monsterLoading)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 242)
                            .padding(.top,36)
                            .padding(.trailing,22)
                    }
                    .padding(.bottom,126)
                    
                    VStack {
                        Spacer()
                        
                        Image(.orange)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
                            .offset(y: UIScreen.main.bounds.size.width/2)
                            .rotationEffect(.degrees(startAnimation), anchor: .bottom)
                            .onAppear {
                                withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                                    startAnimation = UIScreen.main.bounds.size.width
                                }
                            }
                    }
                    .ignoresSafeArea()
                }
                .onAppear {
                    moveClockwise.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
            else{
                SummaryPersonalInfoPage()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProcessingInfoPage()
}
