//
//  PlayBtn.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/11/24.
//

import SwiftUI

struct PlayButtonStyle : ViewModifier {
    
    func body(content: Content) -> some View {
        content
        
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .foregroundStyle(.white)
            .font(.system(size: 30, weight: .semibold, design: .default))
    }
}
    

extension View {
    func addStylePlayBtn() -> some View{
        modifier(PlayButtonStyle())
    }
    
}



