//
//  ContentView.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 03/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    WelcomeView()
}
