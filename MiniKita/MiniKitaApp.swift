//
//  MiniKitaApp.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 03/05/24.
//

import SwiftUI
import SwiftData

@main
struct MiniKitaApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .preferredColorScheme(.light)
                .modelContainer(for: [
                    Challenge.self,
                    DailyIntake.self
                ])
        }
    }
}
