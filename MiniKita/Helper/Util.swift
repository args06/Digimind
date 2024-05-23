//
//  Util.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 20/05/24.
//

import Foundation
import SwiftUI

func backgroundColorTop(condition: CalorieCondition) -> Color {
    return if condition == .full {
        Color("IguanaGreen")
    } else if condition == .over {
        Color("PersianRed")
    } else {
        Color("Rajah")
    }
}

func backgroundColorBottom(condition: CalorieCondition) -> Color {
    return if condition == .full {
        Color("LightGreens")
    } else if condition == .over {
        Color("CoralRed")
    } else {
        Color("PeachOrange")
    }
}
