//
//  AlmostThereView.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 25/05/24.
//

import SwiftUI

struct AlmostThereView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Spacer()
            // Title 3
            VStack(alignment: .leading) {
                Text("Almost there!")
                    .font(
                        Font.custom("SF Pro", size: 32)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                Text("Great job!")
                    .font(Font.custom("SF Pro", size: 20))
                    .foregroundColor(.black)
                    .frame(width: 310, alignment: .topLeading)
            }
            
            Spacer()
            // Title 3
            ZStack {
                VStack(alignment: .leading) {
                    Text("Did you know?")
                        .font(Font.custom("SF Pro", size: 20))
                        .foregroundColor(.black)
                        .frame(width: 310, alignment: .topLeading)
                    
                    // Caption1
                    Text("Your activity level affects your calorie needs. The more you move, the more you can groove with extra calories!")
                        .font(Font.custom("SF Pro", size: 12))
                        .foregroundColor(Color(red: 0.39, green: 0.39, blue: 0.4))
                        .frame(width: 204, alignment: .topLeading)
                }
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text( "")
                            .font(Font.custom("SF Pro", size: 20))
                            .foregroundColor(.black)
                            .frame(width: 310, alignment: .topLeading)
                        
                        // Caption1
                        Text("")
                            .font(Font.custom("SF Pro", size: 12))
                            .foregroundColor(Color(red: 0.39, green: 0.39, blue: 0.4))
                            .frame(width: 204, alignment: .topLeading)
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 227, height: 322)
                        .background(
                            Image("AlmostThere")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 227, height: 322)
                                .clipped()
                        )
                }
                .padding(.horizontal, -150)
            }
            
            Spacer()
            
            // Title 3
            VStack {
                Text("and also...")
                    .font(Font.custom("SF Pro", size: 20))
                    .foregroundColor(.black)
                    .frame(width: 340, alignment: .topLeading)
                // Caption1
                Text("Your gut microbiome regulates your calorie intake! These tiny microbes play a big role in energy processing and storage. Keep them happy, and they'll keep you healthy!")
                    .font(Font.custom("SF Pro", size: 12))
                    .foregroundColor(Color(red: 0.39, green: 0.39, blue: 0.4))
                    .frame(width: 342, alignment: .top)
            }
            Spacer()
            
        }
    }
}

#Preview {
    AlmostThereView()
}
