//
//  BarView.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 25/05/24.
//

import SwiftUI

struct BarView: View {
    let index: Int
    @Binding var currentPage: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(checkCurrentPage())
            .frame(height: 8 / UIScreen.main.scale)
    }
    
    func checkCurrentPage() -> Color {
        if index <= currentPage {
            return Color.black
        }
        
        return Color.black.opacity(0.20)
    }
}

struct DotView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarView(index: 0, currentPage: .constant(0))
                .previewLayout(.fixed(width: 50, height: 10))
            
            BarView(index: 1, currentPage: .constant(0))
                .previewLayout(.fixed(width: 50
                                      , height: 10))
        }
    }
}
