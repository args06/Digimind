//
//  OnboardView.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 24/05/24.
//

import SwiftUI

struct OnboardView: View {
    @StateObject var model = OnboardingViewModel()
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            title
            progressBar
            tabView
            navBar
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
    }
    
    var title: some View {
        HStack {
            CustomNavigationPrevButton(type: .previous, action: {
                self.currentPage -= 1
            })
            .opacity(self.currentPage > 0 ? 1 : 0)
            .padding(.horizontal, 20)
            Spacer()
            Text("title goes here")
            Spacer()
            Spacer()
            Spacer()
        }
    }
    
    var progressBar: some View {
        HStack(spacing: 0) {
            
            ForEach(0..<6, id: \.self) { index in
                BarView(index: index, currentPage: self.$currentPage)
            }
        }
        .padding(.horizontal, 20)
    }
    
    
    var tabView: some View {
        TabView(selection: $currentPage) {
            PersonalInfoView()
                .environmentObject(model)
                .tag(0)
            ActivityLevelView()
                .environmentObject(model)
                .tag(1)
            ActivityLevel2View()
                .environmentObject(model)
                .tag(2)
            AlmostThereView()
                .environmentObject(model)
                .tag(3)
            AllergiesPage()
                .environmentObject(model)
                .tag(4)
            DislikesPage()
                .environmentObject(model)
                .tag(5)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    var navBar: some View {
        
        
        CustomNavigationNextButton(type: .next, action: {
            self.currentPage += 1
        })
        .opacity(self.currentPage == 6 ? 0 : 1)
        .padding(15)
        .background(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
