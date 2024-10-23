//
//  GameView.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/20/24.
//

import SwiftUI

struct GameView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var positionLowerCloud: Double = -150
    @State private var positionUpperCloud: Double = -175
    @State private var usersAnswer = ""
    @State private var multNumbersEasy = Int.random(in: 0...5)
    @State private var multNumbersMedium = Int.random(in: 5...10)
    @State private var multNumbersHard = Int.random(in: 10...20)
    
    var body: some View {
        ZStack{
            
            Color.green.brightness(0.4)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                HStack{
                    
                    Image("hippo", bundle: .main)
                        .resizable()
                        .frame(width: 110, height: 100)
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 200, height: 75)
                            .foregroundStyle(.white)
                        Text("What is").font(.system(size: 18))
                    }
                    
                    
                }
                Spacer()
                Spacer()
                ZStack{
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200, height: 75)
                        .foregroundStyle(.secondary)
                    
                    Text(" 5 x \(multNumbersEasy)").font(.system(size: 32)).bold().foregroundStyle(.white)
                }
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20).foregroundStyle(.white)
                        .frame(height: 500)
                        .padding()
                    TextField("Hello", text: $usersAnswer)
                        .titleStyle()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        .frame(width: 150, height: 100)
                        .keyboardType(.numberPad)
                        
                }
                Text("Score: 9").titleStyle()
                
            }
            
            
            
        }
    }
}
#Preview {
    GameView()
}
