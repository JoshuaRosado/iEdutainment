//
//  ContentView.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/7/24.
//

import SwiftUI


struct ContentView: View {
    @State private var difficultyRange = ["Easy", "Medium", "Hard"]
    @State private var amountOfQuestions = 0
    @State private var randomQuestion = Int.random(in: 0...12)
    @State private var appWasOpened = false
    @State private var play = false
    @State private var positionLowerCloud: Double = -150
    @State private var positionUpperCloud: Double = 0
    
    @State private var didGameEnd = false
    @State private var numberOfQuestions = 0

    var body: some View {
        
        ZStack{
            // ===== BG sky and sun
            RadialGradient(colors: [.red,.orange, .yellow, .blue.opacity(0.5)], center: .topLeading, startRadius: 50, endRadius: 300)
                .ignoresSafeArea()
            
            // ====== Clouds with animation
                Clouds(lowerCloud: positionLowerCloud, upperCloud: positionUpperCloud)
            
            // ====== Play/ Start Button
            
            Button(){
                play.toggle()
                withAnimation{
                    positionLowerCloud = 900
                    positionUpperCloud = 800
                
                }
                
            } label: {
                Text(play ? "Started": "Start")
                    
            }
            
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .foregroundStyle(.white)
            .font(.system(size: 30, weight: .semibold, design: .default))
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
