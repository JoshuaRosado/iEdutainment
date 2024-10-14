//
//  ContentView.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/7/24.
//

import SwiftUI



struct ContentView: View {
    @State private var difficultyValue = 0
    @State private var difficultyRange = ["Easy", "Medium", "Hard"]
    @State private var amountOfQuestions = 0
    @State private var randomQuestion = Int.random(in: 0...12)
    @State private var appWasOpened = false
    @State private var play = false
    @State private var positionLowerCloud: Double = -150
    @State private var positionUpperCloud: Double = 0
    
    @State private var didGameEnd = false

    var body: some View {
        
        ZStack{
            // ===== BG sky and sun
            RadialGradient(colors: [.red,.orange, .yellow, .blue.opacity(0.5)], center: .topLeading, startRadius: 50, endRadius: 300)
                .ignoresSafeArea()
            
            // ====== Clouds with animation
                Clouds(lowerCloud: positionLowerCloud, upperCloud: positionUpperCloud)
            
            // ====== Play/ Start Button
            VStack{
                Spacer()
                Text("Multiplication"
                ).font(.system(size: 45, weight: .semibold, design: .rounded)).foregroundStyle(.blue.opacity(0.5)).fontWeight(.semibold).padding(.bottom)
                    .shadow(color: Color.white.opacity(0.6), radius: 4, x: 3, y: 3)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                Button(){
                    
                    withAnimation(.linear(duration: 1.0)){
                        play.toggle()
                        positionLowerCloud = 900
                        positionUpperCloud = 800
                        
                    }
                } label: {
                    Text("Play")
                }
                .addStylePlayBtn()
                .opacity(play ? 0 : 1)
                Spacer()
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
