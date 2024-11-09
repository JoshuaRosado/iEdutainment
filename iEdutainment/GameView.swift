//
//  GameView.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/20/24.
//

import SwiftUI


struct QuestionGenerator: View {
    
    var body: some View {
        Text("Hello")
        
    }
}
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
    @FocusState private var txtFieldIsFocused: Bool
    @State var rounds = 0
    @State private var isAnswerCorrect = false
    @State private var validatingTitle = ""
    @State private var correctAnswer = 0
    @State private var resultMessage = ""
    @State private var isAnswerIncorrect = false
    @State private var isAnswerEntered = false
    @Environment(\.colorScheme) var colorScheme
    @State private var positionLowerCloud: Double = -150
    @State private var positionUpperCloud: Double = -175
    @State private var usersAnswer = 0
    @State private var counter = 0
    let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .none
            formatter.zeroSymbol  = ""
            return formatter
        }()
    @State private var easyList = [1,2,3,4,5].shuffled()
    @State private var multNumbersEasy = 0
    @State private var mediumList = [6,7,8,9,10].shuffled()
    @State private var multNumbersMedium = 0
    @State private var hardList = [11,12,13,14,15].shuffled()
    @State private var multNumbersHard = 0
    @State private var score = 0
    @State private var isGameOver = false
    @State private var isDifficultyEasy = false
    @State private var isDifficultyMedium = false
    @State private var isDifficultyHard = false
    @State private var checkSettings = false
    @State var gameViewVisible : Bool
    @FocusState var isInputActive: Bool
    
    
    @State var animalsEasyDifficulty = ["bear","buffalo","chick","chicken", "cow","crocodile", "dog", "duck", "elephant"].shuffled()
    @State var animalsMediumDifficulty =
    [ "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda"].shuffled()
    @State var animalsHardDifficulty =
    ["penguin", "pig", "rabbit", "rhino", "sloth", "snake", "walrus", "whale", "zebra"].shuffled()
    
    @State private var motivationQuotes = [
        "You got this!", "You are so smart", "Keep going!", "Amazing job!", "You are learning fast", "If you don't know, is okay.", "You are getting better", "Don't give up", "Learning makes you smarter"].shuffled()
    
    @State private var resultMotivationMessages = ["Great job!", "Amazing!", "You're awesome!", "Yeah!", "You are a Pro!", "Look at you go!", "Outstanding!", "Perfecto!", "Muy bien!", "Buen trabajo!", "Excelente", "Excellent"].shuffled()
    

    
    var body: some View {
        
        if gameViewVisible{
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
                        
                            ForEach(0..<1){ number in
                                Text(" \(multiplicationTable) x \(easyList[counter])").mainQuestionStyle()
                                
                                
                            }
                            
                            
                            
                        case "Medium":
                            ForEach(0..<1){ number in
                                Text(" \(multiplicationTable) x \(mediumList[number])").mainQuestionStyle()
                            }
                            
                        case "Hard":
                            ForEach(0..<1){ number in
                                Text(" \(multiplicationTable) x \(hardList[number])").mainQuestionStyle()
                            }
                            
                        default:
                            Text("There was an error")
                        }
                        
                        
                        
                    }
                    .padding(.top,25)
                    
                    
                    ZStack{
                        
                        VStack{
                            TextField("Results", value: $usersAnswer, formatter: numberFormatter
                            )
                                .textFieldStyle(.roundedBorder)
                                .background(Color.white)
                                .multilineTextAlignment(.center)
                                .titleStyle()
                                .focused($txtFieldIsFocused)
                                .keyboardType(.numberPad)
                                .onSubmit {
                                    usersAnswer = 0
                                                }

                                .toolbar {
                                    ToolbarItemGroup(placement: .keyboard){
                                        Spacer()
                                        
                                        Button("Enter"){
                                            withAnimation{
                                                isAnswerEntered = true
                                                isInputActive = false
                                                txtFieldIsFocused = false
                                                
                                                
                                                
                                                validatingAnswer(answer: usersAnswer)
                                            }
                                        }
                                        
                                        
                                    }
                                }
                            
                            
                        }
                        
                    }
                    
                    Spacer()
                    Text("Score: \(score)").titleStyle().bold().opacity(0.4)
                    
                    
                }
                
                .alert("\(validatingTitle)", isPresented: $isAnswerEntered){
                    Button("Next"){
                        withAnimation{
 
                            gameLimit(amountOfQuestions: amountOfQuestions)
                        }
                        
                    }
                    
                }message: {
                    Text("\(resultMessage)")
                }
                
                
                .alert("Game Over", isPresented: $isGameOver){
                    
                    Button("Try again", action: resetGame)
                    Button("Settings", action: goToSettings)
                    
                } message: {
                    Text("Final Score: \(score) / \(rounds)")
                    
                }
                
                
            }
            
            
        }
        if checkSettings{
            SettingsView()
        }
        
    }
    
    func resetGame(){
        withAnimation(.linear(duration: 1.5)){
            easyList = [1,2,3,4,5].shuffled()
            mediumList = [6,7,8,9,10].shuffled()
            hardList = [11,12,13,14,15].shuffled()
            nextRound()
            rounds = 0
            score = 0
            counter = 0
        }
        
        
        
    }
    

    
    func easyNumList(emptyList:[Int]) -> [Int]{
        var newList = emptyList
        for num in 0..<11{
            newList.append(num)
        }
        return newList.shuffled()
    }
    
    
    func goToSettings(){
        withAnimation(.linear(duration: 1.2) ){
            checkSettings = true
            
        }
        hideGame()
        
    }
    func hideGame(){
        withAnimation(.bouncy(duration:1.4)){
            gameViewVisible = false
        }
        
    }
    

    func gameLimit(amountOfQuestions: Int){
        if rounds < amountOfQuestions{
            nextRound()
        } else if rounds == amountOfQuestions{
            isGameOver = true
        }
    }
    func nextRound(){
        if counter < 4 {
            counter += 1
        } else if counter == 4 {
            counter = 0
        }
        
        
        usersAnswer = 0
        isAnswerCorrect = false
        isAnswerIncorrect = false
        motivationQuotes = [
            "You got this!", "You are so smart", "Keep going!", "Amazing job!", "You are learning fast", "If you don't know, is okay.", "You are getting better", "Don't give up", "Learning makes you smarter"].shuffled()
        
        if difficultyLevel == "Easy"{
            animalsEasyDifficulty = ["bear","buffalo","chick","chicken", "cow","crocodile", "dog", "duck", "elephant"].shuffled()
        
        } else if difficultyLevel == "Medium"{

            animalsMediumDifficulty =
            [ "frog", "giraffe", "goat", "gorilla", "hippo", "horse", "monkey", "moose", "narwhal", "owl", "panda"].shuffled()
        } else if difficultyLevel == "Hard" {

            animalsHardDifficulty =
            ["penguin", "pig", "rabbit", "rhino", "sloth", "snake", "walrus", "whale", "zebra"].shuffled()
        }
    }
    func validatingAnswer( answer : Int){
        multNumbersEasy = (easyList[counter])
        multNumbersMedium = (easyList[counter])
        multNumbersHard = (easyList[counter])
        correctAnswer = multiplicationTable * multNumbersEasy
        usersAnswer = answer
        rounds += 1
        if difficultyLevel == "Easy"{

            if (usersAnswer) == (correctAnswer){
                score += 1
                isAnswerCorrect = true
                validatingTitle = "Correct"
                resultMessage = "Great job!"
                
                
            } else {
                isAnswerIncorrect = true
                validatingTitle = "Incorrect"
                resultMessage = "\(multiplicationTable) x \(multNumbersEasy) =  \(correctAnswer)"
                
                
            }
        } else if difficultyLevel == "Medium"{
            
            if (usersAnswer) == correctAnswer{
                score += 1
                isAnswerCorrect = true
                validatingTitle = "Correct"
                resultMessage = "Great job!"
                
            } else {
                isAnswerIncorrect = true
                validatingTitle = "Incorrect"
                resultMessage = "\(multiplicationTable) x \(multNumbersEasy) =  \(correctAnswer)"
            }
        } else if difficultyLevel == "Hard"{
            
            if (usersAnswer) == correctAnswer{
                score += 1
                isAnswerCorrect = true
                validatingTitle = "Correct"
                resultMessage = "Great job!"
                
            } else {
                isAnswerIncorrect = true
                validatingTitle = "Incorrect"
                resultMessage = "\(multiplicationTable) x \(multNumbersEasy) =  \(correctAnswer)"
            }
        }
    }
}
//#Preview {
//    GameView( multiplicationTable: 1, difficultyLevel: "Easy", amountOfQuestions: 5)
//}
