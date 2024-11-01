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

struct EnterBtn: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint( .secondary)
            .brightness(0.4)
            .controlSize(.extraLarge)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .foregroundStyle(.white)
            .font(.title)

    }
}

extension View{
    func enterBtn() -> some View {
        modifier(EnterBtn())
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
    @State var rounds = 0
    @State private var isAnswerCorrect = false
    @State private var validatingTitle = ""
    @State private var isAnswerIncorrect = false
    @State private var isAnswerEntered = false
    @Environment(\.colorScheme) var colorScheme
    @State private var positionLowerCloud: Double = -150
    @State private var positionUpperCloud: Double = -175
    @State private var usersAnswer = 0
    @State private var multNumbersEasy = Int.random(in: 0...10)
    @State private var multNumbersMedium = Int.random(in: 10...30)
    @State private var multNumbersHard = Int.random(in: 30...100)
    @State private var score = 0
    @State private var isGameOver = false
    @State private var isDifficultyEasy = false
    @State private var isDifficultyMedium = false
    @State private var isDifficultyHard = false
    
    @State var animalsEasyDifficulty = ["bear","buffalo","chick","chicken", "cow","crocodile", "dog", "duck", "elephant"].shuffled()
    @State var animalsMediumDifficulty =
    [ "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda"].shuffled()
    @State var animalsHardDifficulty =
    ["penguin", "pig", "rabbit", "rhino", "sloth", "snake", "walrus", "whale", "zebra"].shuffled()
    
    @State private var motivationQuotes = [
        "You got this!", "You are so smart", "Keep going!", "Amazing job!", "You are learning fast", "If you don't know, is okay.", "You are getting better", "Don't give up", "Learning makes you smarter"].shuffled()
    

    
    var body: some View {
        ZStack{
            switch difficultyLevel{
            case "Easy":
                Color.green.brightness(0.4)
                    .ignoresSafeArea()
                
            case "Medium":
                Color.purple.brightness(0.4)
                    .ignoresSafeArea()
            case "Hard":
                Color.red.brightness(0.4)
                    .ignoresSafeArea()
            default:
                Color.secondary
                    .ignoresSafeArea()
            }
            
            
            VStack{
                VStack{
                    
                    ForEach(0..<1){ number in
                        if difficultyLevel == "Easy"{
                            Image(ImageResource(name: animalsEasyDifficulty[number], bundle: .main))
                                .resizable()
                                .frame(width: 100, height: 100).padding()
                        }
                        else if difficultyLevel == "Medium"{
                            Image(ImageResource(name: animalsMediumDifficulty[number], bundle: .main))
                                .resizable()
                                .frame(width: 100, height: 100).padding()
                        }
                        else if difficultyLevel == "Hard"{
                            Image(ImageResource(name: animalsHardDifficulty[number], bundle: .main))
                                .resizable()
                                .frame(width: 100, height: 100).padding()
                            
                        }
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
                        .frame( height: 250 )
                        .foregroundStyle(isAnswerCorrect ? .blue.opacity(0.4): isAnswerIncorrect ? .red.opacity(0.4) : .secondary.opacity(0.2))
                        .animation(.linear(duration: 0.3).delay(0.1), value: isAnswerCorrect )
                        .animation(.linear(duration: 0.3).delay(0.1),value: isAnswerIncorrect)
                    
                    
                    Circle()
                        .stroke(lineWidth: 15)
                        .frame( height: 175 )
                        .foregroundStyle(isAnswerCorrect ? .blue.opacity(0.5): isAnswerIncorrect ? .red.opacity(0.5) :
                                .secondary.opacity(0.2))
                        .animation(.linear(duration: 0.5).delay(0.2),value: isAnswerCorrect)
                        .animation(.linear(duration: 0.5).delay(0.2) ,value: isAnswerIncorrect)
                    
                    
                    
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
                
//                Spacer()
                ZStack{
                    VStack(spacing: 40){
                        
                        TextField("Result", value: $usersAnswer, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                            .background(Color.white)
                            .multilineTextAlignment(.center)
                            .titleStyle()
                            .keyboardType(.numberPad)
                        
                        
                        
                        Button("Enter"){
                            withAnimation{
                                isAnswerEntered = true
                                
                                
                                validatingAnswer(answer: usersAnswer)
                            }
                        }
                        .enterBtn()
                        
                    }
                    
                }
                
                Spacer()
                Text("Score: \(score)").titleStyle().bold().opacity(0.4)
                
                
            }
            
            .alert("\(validatingTitle)", isPresented: $isAnswerEntered){
                Button("Next"){
                    withAnimation{
                        usersAnswer = 0
                        
                        gameLimit(amountOfQuestions: amountOfQuestions)
                    }

                }
                
            }
            
            .alert("Game Over", isPresented: $isGameOver){
                
                Button("Try again", action: resetGame)
                
            } message: {
                Text("Final Score: \(score) / \(rounds)")
 
            }
            
            
        }
    }
    func resetGame(){
        nextRound()
        rounds = 0
        score = 0
        
        
    }
    func gameLimit(amountOfQuestions: Int){
        if rounds < amountOfQuestions{
            nextRound()
        } else if rounds == amountOfQuestions{
            isGameOver = true
        }
    }
    func nextRound(){
        isAnswerCorrect = false
        isAnswerIncorrect = false
        if difficultyLevel == "Easy"{
            multNumbersEasy = Int.random(in: 0...10)
            animalsEasyDifficulty = ["bear","buffalo","chick","chicken", "cow","crocodile", "dog", "duck", "elephant"].shuffled()
        
        } else if difficultyLevel == "Medium"{
            multNumbersMedium = Int.random(in: 10...30)
            animalsMediumDifficulty =
            [ "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda"].shuffled()
        } else if difficultyLevel == "Hard"{
            multNumbersHard = Int.random(in: 30...100)
            animalsHardDifficulty =
            ["penguin", "pig", "rabbit", "rhino", "sloth", "snake", "walrus", "whale", "zebra"].shuffled()
        }
    }
    func validatingAnswer( answer : Int){
        rounds += 1
        if difficultyLevel == "Easy"{

            if usersAnswer == (multiplicationTable * multNumbersEasy){
                score += 1
                isAnswerCorrect = true
                validatingTitle = "Correct"
                
                
            } else {
                isAnswerIncorrect = true
                validatingTitle = "Incorrect"
            }
        } else if difficultyLevel == "Medium"{
            
            if usersAnswer == (multiplicationTable * multNumbersMedium){
                score += 1
                isAnswerCorrect = true
                validatingTitle = "Correct"
                
            } else {
                isAnswerIncorrect = true
                validatingTitle = "Incorrect"
            }
        } else if difficultyLevel == "Hard"{
            
            if usersAnswer == (multiplicationTable * multNumbersHard){
                score += 1
                isAnswerCorrect = true
                validatingTitle = "Correct"
                
            } else {
                isAnswerIncorrect = true
                validatingTitle = "Incorrect"
            }
        }
    }
}
#Preview {
    GameView(multiplicationTable: 1, difficultyLevel: "Easy", amountOfQuestions: 5)
}
