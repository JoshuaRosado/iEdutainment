//
//  DifficultyStepper.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/11/24.
//

import SwiftUI

struct DiffcultyPickerView: View {
    @State private var value = 0
    let difficultyRange = ["Easy", "Medium", "Hard"]
    @State private var selectedDifficulty = "Easy"
    
    var body: some View{
        Picker("Difficulty", selection: $selectedDifficulty){
            ForEach(difficultyRange, id: \.self){
                Text($0)
            }
        }
        Text("Difficulty: \(selectedDifficulty)")
    }
}
