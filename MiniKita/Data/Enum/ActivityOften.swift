//
//  ActivityOften.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import Foundation

enum ActivityOften: String, CaseIterable, Codable {
    case never = "Never"
    case casual = "1 - 2 times a week"
    case maintain = "3 - 4 times a week"
    case dedicate = "5 - 6 times a week"
    case everyday = "Everyday"
    case other
}
