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
    var body: some View {
        ZStack{
            
            
            ZStack{
                RadialGradient(colors: (colorScheme == .light ? [.red,.orange, .yellow, .blue.opacity(0.5)] : [.white,.white, .white.opacity(0.8), .blue.opacity(0.5)]) , center: .topLeading, startRadius: 50, endRadius: 300)
                    .ignoresSafeArea()
                
                Clouds(lowerCloud: positionLowerCloud, upperCloud: positionUpperCloud)
                VStack{
                    Mountains()
                }
                .position(x: 200, y: 850)
                .onAppear(perform: {
                    positionLowerCloud = 900
                    positionUpperCloud = 800
                })
            }
            Rectangle()
                .fill(.ultraThinMaterial).opacity(0.8)
                .ignoresSafeArea()
                
        }
    }
}

#Preview {
    GameView()
}
