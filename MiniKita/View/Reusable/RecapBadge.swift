//
//  RecapBadge.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct RecapBadge: View {
    var body: some View {
        VStack {
            Image(.badge)
                .resizable()
                .scaledToFit()
                .frame(width: 209)
            
            Text("Congratulations!")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .padding(.top, 10)
            
            Text("You did it! You've successfully completed today's challenge. Keep up the great work and continue making healthy choices. Let's see what tomorrow brings!")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .fontWeight(.regular)
                .padding(.top, 24)
            
            
        }
    }
}

#Preview {
    RecapBadge()
}
