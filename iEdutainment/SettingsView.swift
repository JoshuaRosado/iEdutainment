//
//  DifficultyStepper.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/11/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var value = 0
    let difficultyRange = ["Easy", "Medium", "Hard"]

    @State private var selectedDifficulty = "Easy"
    
    
    var body: some View{
        List{
            Section{
                Text("Choose difficulty")
                    .font(.title).foregroundStyle(.secondary)
                
                Picker("Difficulty", selection: $selectedDifficulty){
                    ForEach(difficultyRange, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(50)
                
            }
            
        }
        .background(.thinMaterial)
        .scrollContentBackground(.hidden)
    }
}
