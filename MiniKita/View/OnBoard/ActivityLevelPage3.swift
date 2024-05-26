//
//  PersonalInfo.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 25/05/24.
//

import SwiftUI

struct ActivityLevelPage3: View {
    @State private var selectedActivityMinute : ActivityMinute = .other
    
    var body: some View {
        VStack{
            ProgressBar(
                progress: 4/6,
                height: 4,
                foregroundColor: .maximumBlueGreen
            )
            .padding(.horizontal, 16)
            .padding(.top, 1)
            .frame(height: 1)
            
            ZStack{
                VStack(alignment:.leading)
                {
                    Text("Almost There !")
                        .fontWeight(.medium)
                        .font(.system(size: 32))
                        .foregroundStyle(.raisinBlack)
                        .padding(.bottom,12)
                    
                    Text("Great job!")
                        .fontWeight(.regular)
                        .font(.title3)
                        .foregroundStyle(.raisinBlack)
                        .padding(.bottom,80)
                    
                    Text("Did you know?")
                        .fontWeight(.regular)
                        .font(.title3)
                        .foregroundStyle(.raisinBlack)
                        .padding(.bottom,18)
                    
                    Text("Your activity level affects your calorie needs. The more you move, the more you can groove with extra calories!")
                        .fontWeight(.regular)
                        .font(.footnote)
                        .foregroundStyle(.raisinBlack)
                        .padding(.bottom,64)
                        .frame(width: 204)
                    
                    Text("and also...")
                        .fontWeight(.regular)
                        .font(.title3)
                        .foregroundStyle(.raisinBlack)
                        .padding(.bottom,18)
                    
                    Text("Your gut microbiome regulates your calorie intake! These tiny microbes play a big role in energy processing and storage. Keep them happy, and they'll keep you healthy!")
                        .fontWeight(.regular)
                        .font(.footnote)
                        .foregroundStyle(.raisinBlack)
                }
                .padding(.leading,23)
                .hSpacing(.leading)
                
                Image(.ngintip)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 322)
                    .scaleEffect(x:-1,y: 1)
                    .hSpacing(.trailing)
            }
            .allSpacing()
            
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .background(.antiFlashWhite)
        .safeAreaInset(edge: .bottom) {
            NavigationLink {
                AllergiesPage()
            } label: {
                Text("Got it!")
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
        ActivityLevelPage3()
    }
}
