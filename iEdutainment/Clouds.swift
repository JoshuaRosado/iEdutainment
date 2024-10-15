//
//  Clouds.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/11/24.
//

import SwiftUI

struct Clouds: View {
    var lowerCloud: Double
    var upperCloud: Double
    
    var body: some View{
        VStack{
            
            
            Section{
                Circle()
                    .frame(width: 120, height: 200)
                    .position(x: 50, y: 400)
                Circle()
                    .frame(width: 150, height: 125)
                    .position(x: 160, y: 150)
                Circle()
                    .frame(width: 150, height: 175)
                    .position(x: 120, y: 0)
                Circle()
                    .frame(width: 125, height: 180)
                    .position(x: 200, y: -200)
            }
            .foregroundStyle(.white)
            .position(x: CGFloat(lowerCloud), y: CGFloat(-100))
            .animation(.linear(duration: 25).repeatForever(autoreverses: false), value: lowerCloud)
            .shadow(color: .black.opacity(0.2), radius: 30, x: 100, y: 600)
        }
        VStack{
            
            
            Section{
                Circle()
                    .frame(width: 120, height: 200)
                    .position(x: 50, y: 400)
                Circle()
                    .frame(width: 150, height: 125)
                    .position(x: 80, y: 160)
                Circle()
                    .frame(width: 190, height: 140)
                    .position(x: 120, y: 0)
                Circle()
                    .frame(width: 150, height: 130)
                    .position(x: 180, y: -200)
            }
        }
        .foregroundStyle(.white)
        .position(x: CGFloat(upperCloud), y: CGFloat(120))
        .animation(.linear(duration: 45).repeatForever(autoreverses: false), value: upperCloud)
        .shadow(color: .black.opacity(0.2), radius: 30, x: 100, y: 600)
    }
}
