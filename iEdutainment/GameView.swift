//
//  GameView.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/20/24.
//

import SwiftUI



struct QuestionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white).bold().font(.system(size: 32))
    }
}

extension View{
    func mainQuestionStyle() -> some View {
        modifier(QuestionModifier())
    }
}

struct GameView: View {
    @State var multiplicationTable: Int
    @State var difficultyLevel: String
    @State var amountOfQuestions: Int
    
    
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
                    
                    Image("dog", bundle: .main)
                        .resizable()
                        .frame(width: 95, height: 110)
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
                    
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 50)
                        .foregroundStyle(.secondary)
                    
                    
                    
                    switch difficultyLevel {
                    case "eEasy":
                        Text(" \(multiplicationTable) x \(multNumbersEasy)").mainQuestionStyle()
                        
                    case "Medium":
                        Text(" \(multiplicationTable) x \(multNumbersMedium)").mainQuestionStyle()
                        
                    case "Hard":
                        Text(" \(multiplicationTable) x \(multNumbersHard)").mainQuestionStyle()
                        
                    default:
                        Text("There was an error")
                    }
                    
                    
                    
                }
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20).foregroundStyle(.white)
                        .frame(height: 450)
                        .padding()
                    TextField("Enter results", text: $usersAnswer)
                        .titleStyle()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        .frame(width: 200, height: 100)
                        .keyboardType(.numberPad)
                        
                }
                Text("Score: 9").titleStyle()
                
            }
            
            
            
        }
    }
}
//#Preview {
//    GameView(multiplicationTable: 2, difficultyLevel: "easy", amountOfQuestions: 20)
//}
