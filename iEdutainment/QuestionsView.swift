//
//  QuestionsView.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/23/24.
//



import SwiftUI

struct QuestionsView: View {
    @State private var difficultySelected: String
    @State private var questionsAmountSelected: Int
    @State private var multiplicationTableSelected: Int
    @State private var multiplicationTableSelectedForQuestion = 1
    @State private var usersAnswer = 10
    @State private var score = 0
    

    
    var body: some View {
        VStack{
            Text("2 x 5")
            TextField("Hello", value:$usersAnswer, format: .number)
            
            
            
            

        }
        
        

        
    }
}
