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
    @State private var value = 0
    @State private var multiplicationTableSelected = 0
    let amountOfQuestions = [5,10,20]
    @State private var questionAmount = 5
    let difficultyRange = ["Easy", "Medium", "Hard"]
    @State private var selectedDifficulty = "Easy"
    
    
    
    var body: some View{
        NavigationStack{
                //====================== PICKER FOR MULT TABLE
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
                .padding(.top, -105)
                .toolbar{
                    Button("Start")
                    {
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                    
                    
                }
                
                Section{}
                
            VStack(spacing: 20){
                    Text("multiplication table").titleStyle()
                    
                    Picker("", selection: $multiplicationTableSelected) {
                        ForEach(Array(stride(from: 0, to: 13, by: 1)), id: \.self) { index in
                            Text("\(index)")
                        }
                        
                    } .pickerStyle(.wheel)
                } .frame(height: 175)
                
                
                //================= PICKER FOR DIFFICULTY
                
                Section{
                    Text("difficulty")
                        .titleStyle()
                    
                    Picker("Difficulty", selection: $selectedDifficulty){
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
                    Picker("", selection: $questionAmount){
                        ForEach(amountOfQuestions, id: \.self){
                            Text(String($0))
                        }
                    }
                    .padding()
                    .pickerStyle(.segmented)
                    
                }
                
            
                
                
            }
            .background(.thinMaterial)
            .scrollContentBackground(.hidden)
            
        }
    
    
            
        
}
#Preview {
    ContentView()
}


