//
//  ViewExtension.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import Foundation
import SwiftUI

extension View {
    
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
