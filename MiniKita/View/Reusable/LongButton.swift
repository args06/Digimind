//
//  LongButton.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import SwiftUI

struct LongButtonHighlight: View {
    
    var label: String
    var buttonColor: Color = Color("CarrotOrange")
    var textColor: Color = .antiFlashWhite
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(LocalizedStringKey(label))
                .foregroundStyle(textColor)
                .font(.headline)
                .hSpacing()
                .frame(height: 50)
                .background(buttonColor, in: .rect(cornerRadius: 12))
        })
        .cornerRadius(12)
        .shadow(color: .platinum, radius: 5, y: 3)
        
    }
}

struct LongButton: View {
    
    var label: String
    var buttonColor: Color = Color("CarrotOrange")
    var textColor: Color = .antiFlashWhite
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(LocalizedStringKey(label))
                .foregroundStyle(textColor)
                .font(.headline)
                .hSpacing()
                .frame(height: 50)
                .background(buttonColor, in: .rect(cornerRadius: 12))
        })
        .cornerRadius(12)
    }
}

#Preview {
    LongButton(label: "action_connect_health_kit", action: {
        print("Hi")
    })
}
