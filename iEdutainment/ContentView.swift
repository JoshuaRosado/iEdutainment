//
//  ContentView.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/7/24.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var difficultyValue = 0
    @State private var difficultyRange = ["Easy", "Medium", "Hard"]

    @State private var amountOfQuestions = 0
    @State private var randomQuestion = Int.random(in: 0...12)
    @State private var gameStarted = false
    @State private var play = false
    @State private var positionLowerCloud: Double = -150
    @State private var positionUpperCloud: Double = -175
    @State private var multiplicationTable = Int.random(in: 0..<13)
    @State private var numberMultiplyBy = Int.random(in: 0..<13)
    

    var body: some View {
        
        ZStack{
            // ===== BG sky and sun
            RadialGradient(colors: (colorScheme == .light ? [.red,.orange, .yellow, .blue.opacity(0.5)] : [.white,.white, .white.opacity(0.8), .blue.opacity(0.5)]) , center: .topLeading, startRadius: 50, endRadius: 300)
                .ignoresSafeArea()
            
            // ====== Clouds with animation
            Clouds(lowerCloud: positionLowerCloud, upperCloud: positionUpperCloud)
            
            
            // ====== Play/ Start Button
            VStack{
                VStack{
                    Button(){
                        
                        withAnimation(.linear(duration: 0.8)){
                            play.toggle()
                        }
                    } label: {
                        Text("Play")
                    }
                    .addStylePlayBtn()
                    .opacity(play ? 0 : 1)
                    
                    .onAppear(perform: {
                        positionLowerCloud = 900
                        positionUpperCloud = 800
                    })
                    
                }
                .zIndex(3)
                .position(x: 200, y: 375)
                
                
                // ======== BG Moutains scenic
                Mountains()
                    
                    
                
                    
            }
            
            if play{
               SettingsView()
            }
            if gameStarted{
                GameView()
              
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
