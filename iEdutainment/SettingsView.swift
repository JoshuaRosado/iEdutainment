//
//  DifficultyStepper.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/11/24.
//

import SwiftUI

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title).foregroundStyle(.secondary)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleText())
    }
}




struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var value = 1
    @State private var multiplicationTableSelected = 1
    @State private var questionAmountSelected = 3
    @State private var difficultySelected = "Easy"
    let amountOfQuestions = [3,8,10]
    let difficultyRange = ["Easy", "Medium", "Hard"]
    
    @State private var rounds = 0
    
    
    @State private var answerSubmited = false
    @State private var gameOver = false
    @State private var startGame = false
    @State private var isSettingsVisible = true
    
    
    
    
    
    var body: some View{
        if isSettingsVisible{
            
            
            NavigationStack{
                //====================== PICKER FOR MULT TABLE
                VStack{
                    HStack{
                        
                        Image("parrot", bundle: .main)
                            .resizable()
                            .frame(width: 75, height: 75)
                        ZStack{
                            Rectangle()
                                .fill(.thinMaterial.opacity(0.8))
                                .frame(width: 180, height: 50)
                                .cornerRadius(30)
                                .zIndex(1)
                            
                            Section{
                                Text("Make your choice")
                                    .foregroundStyle(.secondary).bold()
                                    .zIndex(2)
                            }
                        }
                    }
                    .padding(.top, -100)
                }
                
                .toolbar{
                    Button("Start")
                    {
                        startGameMode()
                        
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                    
                    
                }
                
                
                Section{}
                
                VStack(spacing: 20){
                    Text("multiplication table").titleStyle()
                    Picker("", selection: $multiplicationTableSelected) {
                        ForEach(Array(stride(from: 1, to: 13, by: 1)), id: \.self) { index in
                            Text("\(index)")
                        }
                        
                    } .pickerStyle(.wheel)
                } .frame(height: 200)
                
                
                //================= PICKER FOR DIFFICULTY
                
                Section{
                    Text("difficulty")
                        .titleStyle()
                    
                    Picker("Difficulty", selection: $difficultySelected){
                        ForEach(difficultyRange, id: \.self){
                            Text($0)
                            
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(15)
                    
                    
                }
                Section(){
                    Text("questions")
                        .titleStyle()
                    Picker("", selection: $questionAmountSelected){
                        ForEach(amountOfQuestions, id: \.self){
                            Text(String($0))
                            
                            
                        }
                        
                    }
                    .padding()
                    .pickerStyle(.segmented)
                    
                }
                
                
            }
            
            .background(.blue)
        }
        
        if startGame{
            
            
            GameView(multiplicationTable: multiplicationTableSelected, difficultyLevel: difficultySelected, amountOfQuestions: questionAmountSelected, gameViewVisible:startGame)
        }
    }
    func startGameMode(){
        withAnimation(.linear(duration: 1)){
            startGame = true
            
  
        }
        settingsDisappear()
    }
    
    func settingsDisappear(){
        withAnimation(.bouncy(duration:1)){
            isSettingsVisible = false
        }
    }
    
    
    
            
        
}
#Preview {
    ContentView()
}


