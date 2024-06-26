//
//  SplashScreen.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @AppStorage(KEY_ONBOARD)
    var isOnBoardDone: Bool = false
    
    @State var isActive = false
    
    @StateObject var intakeViewModel = IntakeViewModel()
    
    var body: some View {        
        VStack {
            if isActive {
                if isOnBoardDone {
                    Dashboard(intakeViewModel: intakeViewModel)
                } else {
                    WelcomePage(intakeViewModel: intakeViewModel)
                }
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
