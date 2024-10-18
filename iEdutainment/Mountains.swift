//
//  Mountains.swift
//  iEdutainment
//
//  Created by Joshua Rosado Olivencia on 10/18/24.
//


import SwiftUI

struct Mountains: View {
    var body: some View {
        

HStack{
    
    Circle()
        .frame(minWidth: 250)
        .foregroundStyle(.green).brightness(0.06)
        .zIndex(1)
        .position(x: 300, y: 400)
    
    
    Circle()
        .frame(minWidth:400)
        .foregroundStyle(.green).brightness(0.0)
        .zIndex(0)
        .position(x: 300, y: 350)
    
    
    Circle()
        .frame(minWidth:400)
        .foregroundStyle(.green).brightness(0.02)
        .position(x: 10 , y: 400)
    
    
    Circle()
        .frame(minWidth:350)
        .foregroundStyle(.green).brightness(0.04)
        .zIndex(-1)
        .position(x: -200, y: 350)


}

Color.green.brightness(0.09)
    .frame(height: 100)
    .padding(.bottom, -50)


    }
}
