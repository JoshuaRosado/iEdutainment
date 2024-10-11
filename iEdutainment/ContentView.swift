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
            
            Button(){
                play.toggle()
                withAnimation{
                    positionLowerCloud = 900
                    positionUpperCloud = 800
                }
            } label: {
                Text("Play")
            }
            .addStylePlayBtn()
            .opacity(play ? 0 : 1)
            
            if play{
                withAnimation{
                    ZStack{
                        Rectangle()
                            .frame(width: 400, height: 400)
                            .background(.red)
                        DiffcultyPickerView()
                    }
                    
                }
            }

                

        }
        
        
        
    }
}

#Preview {
    ContentView()
}
