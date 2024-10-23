//
//  GameView.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/20/24.
//

import SwiftUI

struct GameView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var positionLowerCloud: Double = -150
    @State private var positionUpperCloud: Double = -175
    @State private var usersAnswer = ""
    @State private var multNumbers = Int.random(in: 0...5)
    
    var body: some View {
        ZStack{
            
            Color.green.brightness(0.4)
                .ignoresSafeArea()
            
            HStack{
                Image("hippo", bundle: .main)
                    .resizable()
                    .frame(width: 110, height: 100)
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 200, height: 75)
                        .foregroundStyle(.white)
                    Text(" 5 x 2").font(.system(size: 32)).bold()
                }
                
            }
            
            
            
        }
    }
}
#Preview {
    GameView()
}
