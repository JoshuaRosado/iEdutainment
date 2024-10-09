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
    @State private var x = -150

    var body: some View {
        
        ZStack{
            RadialGradient(colors: [.red,.orange, .yellow, .blue.opacity(0.5)], center: .topLeading, startRadius: 50, endRadius: 300)
                .ignoresSafeArea()
            VStack{
                Section{
                    Circle()
                        .frame(width: 120, height: 200)
                        .position(x: 50, y: 400)
                    Circle()
                        .frame(width: 150, height: 125)
                        .position(x: 160, y: 150)
                    Circle()
                        .frame(width: 150, height: 175)
                        .position(x: 120, y: 0)
                    Circle()
                        .frame(width: 125, height: 180)
                        .position(x: 200, y: -200)
                }.foregroundStyle(.white)


            }
            VStack{
                Circle()
                    .frame(width: 120, height: 200)
                    .position(x: 50, y: 400)
                Circle()
                    .frame(width: 150, height: 125)
                    .position(x: 80, y: 160)
                Circle()
                    .frame(width: 190, height: 140)
                    .position(x: 120, y: 0)
                Circle()
                    .frame(width: 150, height: 130)
                    .position(x: 180, y: -200)
            }
            .foregroundStyle(.white)
            .position(x: CGFloat(x), y: CGFloat(120))
            .animation(.linear(duration: 6).repeatForever(autoreverses: false), value: x)
            .shadow(color: .black.opacity(0.2), radius: 30, x: 100, y: 600)
            
            Button(){
                play.toggle()
                withAnimation{
                    x = 800
                
                }
                
            } label: {
                Text(play ? "Clicked": "Click")
                    
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
