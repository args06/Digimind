//
//  SwiftUIView.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 07/05/24.
//

import SwiftUI

struct OnBoardPage: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                Text("title_welcome")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                Spacer()
            }
            
            Text("caption_access_health_kit")
                .font(.subheadline)
                .fontWeight(.regular)
                .padding(.top, 24)
            
            Image(systemName: "person.fill")
                .resizable()
                .background(.black)
                .clipShape(
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 16, topTrailing: 16))
                )
                .frame(width: 235, height: 368)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 52)
            
            Text("caption_data_concern")
                .font(.caption2)
                .fontWeight(.regular)
                .foregroundColor(.gray)
                .padding(.top, 24)
            
        }
        .padding(16)
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            LongButton(label: "action_connect_health_kit", action: {
                print("Hi")
            })
            .padding(16)
        }
        
    }
}

#Preview {
    OnBoardPage()
}
