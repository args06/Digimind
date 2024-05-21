//
//  Util.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 20/05/24.
//

import Foundation
import SwiftUI

func backgroundColorTop(condition: String) -> Color {
    return if condition == "Full" {
        Color("IguanaGreen")
    } else if condition == "Over" {
        Color("CoralRed")
    } else {
        Color("PeachOrange")
    }
}

func backgroundColorBottom(condition: String) -> Color {
    return if condition == "Full" {
        Color("LightGreens")
    } else if condition == "Over" {
        Color("PersianRed")
    } else {
        Color("Rajah")
    }
}
