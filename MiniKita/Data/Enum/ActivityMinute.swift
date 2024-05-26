//
//  ActivityLevel.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 22/05/24.
//

import Foundation
import SwiftUI

enum ActivityMinute: String, CaseIterable, Codable {
    case zerominutes = "Zero Minutes"
    case twentyminutes = "20 Minutes"
    case sixtyminutes = "60 Minutes"
    case more = "120 Minutes or more"
    case other
}

