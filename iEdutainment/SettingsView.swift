//
//  DifficultyStepper.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/11/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var value = 0
    @State private var multiplicationTableSelected = 0
    let difficultyRange = ["Easy", "Medium", "Hard"]
    @State private var selectedDifficulty = "Easy"
    
    
    var body: some View{
        List{
            VStack(alignment: .center){
                Text("multiplication table").font(.title).foregroundStyle(.secondary)
                
                Picker("", selection: $multiplicationTableSelected) {
                    ForEach(Array(stride(from: 0, to: 13, by: 1)), id: \.self) { index in
                        Text("\(index)")
                    }
                    
                } .pickerStyle(.wheel)
            } .frame(height: 200)
           
            
            Section{
                Text("difficulty")
                    .font(.title).foregroundStyle(.secondary)
                
                Picker("Difficulty", selection: $selectedDifficulty){
                    ForEach(difficultyRange, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(15)
                
            }
            Section{
                Text("")
            }
            
        }
        .background(.thinMaterial)
        .scrollContentBackground(.hidden)
    }
}
