//
//  Button.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 07/05/24.
//

import SwiftUI

struct LongButton: View {
    
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(LocalizedStringKey(label))
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
        })
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    LongButton(label: "action_connect_health_kit", action: {
        print("Hi")
    })
}
