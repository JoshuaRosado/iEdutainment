//
//  PlayBtn.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/11/24.
//

import SwiftUI


struct MainTitleLight: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 45, weight: .semibold, design: .rounded)).foregroundStyle(.blue.opacity(0.5)).fontWeight(.semibold).padding(.bottom)
                .shadow(color: Color.white.opacity(0.6), radius: 4, x: 3, y: 3)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}

extension View {
    func mainTitleLight() -> some View {
        modifier(MainTitleLight())
    }
}

struct MainTitleDark: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 45, weight: .semibold, design: .rounded)).foregroundStyle(.blue.opacity(0.9)).fontWeight(.semibold).padding(.bottom)
                .shadow(color: Color.black.opacity(0.6), radius: 4, x: 3, y: 3)
                .shadow(color: Color.black.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}

extension View {
    func mainTitleDark() -> some View {
        modifier(MainTitleDark())
    }
}

struct PlayButtonStyle : ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
        
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .foregroundStyle(.white)
            .padding(.top, 15)
            .font(.system(size: 32, weight: .semibold, design: .rounded))
        
         
        HStack{
            Image("giraffe", bundle: .main)
                .resizable()
                .frame(width: 100, height: 100)
            Image("elephant", bundle: .main)
                .resizable()
                .frame(width: 100, height: 100)
            Image("penguin", bundle: .main)
                .resizable()
                .frame(width: 100, height: 100)
        }
        .padding(.top, 45)
        HStack{
            Image("cow", bundle: .main)
                .resizable()
                .frame(width: 100, height: 100)
            Image("frog", bundle: .main)
                .resizable()
                .frame(width: 100, height: 100)
            
        }
        .padding(.bottom, -200)
    }
}
    

extension View {
    func addStylePlayBtn() -> some View{
        modifier(PlayButtonStyle())
    }
    
}



