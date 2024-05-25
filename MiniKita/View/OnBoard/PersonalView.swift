//
//  ContentView.swift
//  Onboarding
//
//  Created by Naufal Satya Akbari on 19/05/24.
//

import SwiftUI

struct PersonalView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        if currentPage > totalPages {
            OnboardingScreen()
        } 
        else {
            OnboardingScreen()
        }
        
    }
}

#Preview {
    PersonalView()
}



//Home Screen
//struct Home: View {
//    var body: some View {
//        VStack {
//            Text("Welcome to Home page")
//                .font(.title)
//            .fontWeight(.heavy)
//            Text("coba belajar")
//            .font(.body)
//            .fontWeight(.medium)
//        }
//           
//    }
//}



var totalPages = 5
//Onboarding Screen

struct OnboardingScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack {
            
            if currentPage == 1 {
                ScreenView(image: "Mascot", title: "Order Food", details: "Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari")
            }
            
            if currentPage == 2 {
                ScreenView(image: "orange", title: "Order Food", details: "Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari")
            }
            
            if currentPage == 3 {
                ScreenView(image: "SplashScreen", title: "Order Food", details: "Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari")
            }
            if currentPage == 4 {
                ScreenView(image: "SplashScreen", title: "Order Food", details: "Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari")
            }
            if currentPage == 5 {
                ScreenView(image: "orange", title: "Order Food", details: "Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari")
            }
            if currentPage == 6 {
                ScreenView(image: "orange", title: "Dislikes", details: "Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari Naufal Satya Akbari")
            }
            
        }
           
    }
}



struct ScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var image: String
    var title: String
    var details: String
    
    var body: some View {
        VStack {
            HStack {
                
                if currentPage == 1 {
                    Text("Personal Info")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                }
                
                if currentPage == 2 {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Text("Activity Level")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    Spacer()
                    Spacer()
                } 
                if currentPage == 3 {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Text("Activity Level")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    Spacer()
                    Spacer()
                }
                if currentPage == 4 {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Text("")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    Spacer()
                    Spacer()
                }
                if currentPage == 5 {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Text("Alergies")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    Spacer()
                    Spacer()
                }
                if currentPage == 6 {
                    Button(action: {
                        currentPage -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Text("Dislikes")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    Spacer()
                    Spacer()
                }

            }.padding()
                .foregroundColor(.black)
            
            HStack {
                
                if currentPage == 1 {
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                } else if currentPage == 2 {
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                } else if currentPage == 3 {
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                } else if currentPage == 4 {
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                    
                } else if currentPage == 5 {
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color.gray.frame(height: 8 / UIScreen.main.scale)
                } else if currentPage == 6 {
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)
                    Color(.coralRed).frame(height: 8 / UIScreen.main.scale)                }
                
            }
            .padding(.horizontal, 35)
            
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 16)
                .frame(height: 300)
            
            Spacer(minLength: 80)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .kerning(1.2)
                .padding(.top)
                .padding(.bottom, 5)
                .foregroundColor(.blue)
            
            
            Text(details)
                .font(.body)
                .fontWeight(.regular)
                .kerning(1.2)
                .padding([.leading, .trailing])
                .multilineTextAlignment(.center)
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
           
            
            Button(action: {
                if currentPage <= totalPages {
                    currentPage += 1
                }
                else {
                    currentPage = 1
                }
            }, label: {
                
                if currentPage == 3 {
                    Text("Get Started")
                        .fontWeight(.semibold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(40)
                        .padding(.horizontal,16)
                } else {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(40)
                        .padding(.horizontal,16)
                }
            })
        }
//        .navigationBarBackButtonHidden(true)
    }
}
