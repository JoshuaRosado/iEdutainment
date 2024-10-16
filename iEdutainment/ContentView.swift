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
                Spacer()
                
                 if colorScheme == .light {
                    Text("Multiplication").mainTitleLight()
                 } else { Text("Multiplication").mainTitleDark()}
                
                Button(){
                    
                    withAnimation(.linear(duration: 0.8)){
                        play.toggle()
                        
                        
                    }
                } label: {
                    Text("Play")
                }
                .addStylePlayBtn()
                .opacity(play ? 0 : 1)
                Spacer()
                
                    .onAppear(perform: {
                    positionLowerCloud = 900
                    positionUpperCloud = 800
                })
                
                HStack{
                    
                    Circle()
                        .frame(maxWidth: 350)
                        .foregroundStyle(.green).brightness(0.1)
                        .zIndex(1)
                        
                    
                    Circle()
                        .frame(maxWidth: 265)
                        .foregroundStyle(.green).brightness(0.1)
                        .zIndex(1)
                        
                    Circle()
                        .frame(maxWidth:180)
                        .foregroundStyle(.green).brightness(0.0)

                    
                    Circle()
                        .frame(maxWidth:270)
                        .foregroundStyle(.green).brightness(0.0)
                        .zIndex(-1)
                        

                }
                .zIndex(-1)
                Color.green.brightness(0.09)
                    .frame(height: 120)
                    .padding(.top, -50)
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
