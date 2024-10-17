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
    @State private var appWasOpened = false
    @State private var play = false
    @State private var positionLowerCloud: Double = -150
    @State private var positionUpperCloud: Double = -175
    
    @State private var didGameEnd = false

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
                .position(x: 200, y: 350)
                HStack{
                    
                    Circle()
                        .frame(minWidth: 250)
                        .foregroundStyle(.green).brightness(0.06)
                        .zIndex(1)
                        .position(x: 300, y: 400)
                        
                    
                    Circle()
                        .frame(minWidth:400)
                        .foregroundStyle(.green).brightness(0.0)
                        .zIndex(0)
                        .position(x: 300, y: 350)
                    
                        
                    Circle()
                        .frame(minWidth:400)
                        .foregroundStyle(.green).brightness(0.02)
                        .position(x: 10 , y: 400)

                    
                    Circle()
                        .frame(minWidth:350)
                        .foregroundStyle(.green).brightness(0.04)
                        .zIndex(-1)
                        .position(x: -200, y: 350)
                        

                }
    
                .zIndex(-1)
                Color.green.brightness(0.09)
                    .frame(height: 100)
                    .padding(.bottom, -50)
                
                    
                    
                
                    
            }
            
            if play{
                    ZStack{
                        Rectangle()
                            .background(.ultraThinMaterial)
                            .ignoresSafeArea()
                        SettingsView()
                    }
                    .animation(.linear, value: play)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
