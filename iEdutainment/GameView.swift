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
            .foregroundStyle(.white).bold().font(.system(size: 50)).shadow(color: .black.opacity(0.5), radius: 50).fontDesign(.rounded)
    }
}

extension View{
    func mainQuestionStyle() -> some View {
        modifier(QuestionModifier())
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
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
    
    @State private var animals = ["bear","buffalo","chick","chicken", "cow","crocodile", "dog", "duck", "elephant", "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda", "parrot", "penguin", "pig", "rabbit", "rhino", "sloth", "snake", "walrus", "whale", "zebra"].shuffled()
    
    @State private var motivationQuotes = [
        "You got this!", "You are so smart", "Keep going!", "Amazing job!", "You are learning fast", "If you don't know, is okay.", "You are getting better", "Don't give up", "Learning makes you smarter"].shuffled()
    
    var body: some View {
        ZStack{
            
            Color.green.brightness(0.4)
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    
                    ForEach(0..<1){ number in
                    
                        Image(ImageResource(name: animals[number], bundle: .main))
                        .resizable()
                        .frame(width: 100, height: 100).padding()
                }
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: 350, maxHeight: 50 )
        
            
                            .foregroundStyle(.white)
                        ForEach(0..<1){number in
                            Text(motivationQuotes[number]).font(.system(size: 18)).foregroundStyle(.secondary
                            )
                        }
                        
                    }
   
                }
                .padding(.top, 25)
                
                ZStack{
                    
                    Circle()
                        .stroke(lineWidth: 10)
                        .frame( height: 300 )
                        .foregroundStyle(.secondary.opacity(0.1))
                        
                    Circle()
                        .stroke(lineWidth: 25)
                        .frame( height: 200 )
                        
                        .foregroundStyle(.secondary.opacity(0.1))
                    
                    
                    
                    switch difficultyLevel {
                    case "Easy":
                        Text(" \(multiplicationTable) x \(multNumbersEasy)").mainQuestionStyle()
                        
                    case "Medium":
                        Text(" \(multiplicationTable) x \(multNumbersMedium)").mainQuestionStyle()
                        
                    case "Hard":
                        Text(" \(multiplicationTable) x \(multNumbersHard)").mainQuestionStyle()
                        
                    default:
                        Text("There was an error")
                    }
                    
                    
                    
                }
                .padding(.top,25)
                
                Spacer()
                ZStack{
                    HStack(spacing: 40){
                        
                        TextField("Result", text: $usersAnswer)
                            .background(Color.white)
                            .multilineTextAlignment(.center)
                            .titleStyle()
                            .frame(width: 100)
                            .keyboardType(.numberPad)
                        
                        Button("Enter"){
                            
                        }
                        .buttonStyle(.plain)
                        .buttonBorderShape(.capsule)
                        .frame(width: 100, height: 35)
                        .background(.red).brightness(0.4)
                        .foregroundStyle(.white)
                        .font(.title)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        
                    }
                        
                }
                
                Spacer()
                Text("Score: 9").titleStyle().bold().opacity(0.6)
                
            }
            
            
            
        }
    }
}
#Preview {
    GameView(multiplicationTable: 1, difficultyLevel: "Easy", amountOfQuestions: 5)
}
