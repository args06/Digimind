//
//  User.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 24/05/24.
//

import Foundation
import SwiftUI

struct User: Codable {
    let name: String
    let birthDate: Date
    let weight: Int
    let height: Int
    let gender: Gender
    let activityLevel: ActivityLevel
    let allergies: [String]
    let dislikes: [String]
}
