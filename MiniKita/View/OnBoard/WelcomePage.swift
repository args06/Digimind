//
//  WelcomePage.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct WelcomePage: View {
    
    @State var startAnimation: CGFloat = 0
    @State private var moveClockwise = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Welcome!")
                        .fontWeight(.semibold)
                        .font(.system(size: 48))
                        .foregroundStyle(.carrotOrange)
                    
                    Text("Ready to jumpstart your fun and \nhealthy lifestyle?")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                    
                    Spacer()
                }
                .padding(.top, 77)
                
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
                
                VStack {
                    Spacer()
                    
                    Image(.monster)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 304, alignment: .bottom)
                        .padding(.bottom, UIScreen.main.bounds.size.width/2 - 52)
                        .padding(.leading, 32)
                }
                
                
                VStack {
                    Spacer()
                    
                    
                    Text("NgeMeal isn’t a substitute for professional advice. Always consult your doctor or nutritionist first.")
                        .multilineTextAlignment(.center)
                        .font(.caption2)
                        .foregroundStyle(.antiFlashWhite)
                        .shadow(color: .raisinBlack, radius: 5, y: 3)
                        .frame(width: UIScreen.main.bounds.size.width * 0.75)
                    
                    NavigationLink {
                        PersonalInfoPage()
                    } label: {
                        Text("Yes, totally!")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .hSpacing()
                            .frame(height: 50)
                            .background(Color("MaximumBlueGreen"), in: .rect(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 8)
                    
                    
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 20)
            }
            .onAppear {
                moveClockwise.toggle()
            }
        }
    }
}

#Preview {
    WelcomePage()
}
