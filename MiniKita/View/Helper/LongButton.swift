//
//  Button.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 07/05/24.
//

import SwiftUI

struct LongButton: View {
    
    var label: String
    var buttonColor: Color = Color("Primary")
    var textColor: Color = .white
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
    }
}

#Preview {
    LongButton(label: "action_connect_health_kit", action: {
        print("Hi")
    })
}
