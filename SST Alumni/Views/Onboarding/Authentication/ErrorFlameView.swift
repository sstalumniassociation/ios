//
//  ErrorFlameView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import SwiftUI

struct ErrorFlameView: View {
    
    @State private var flame1 = CGSize(width: 1, height: 1)
    @State private var flame2 = CGSize(width: 1, height: 1)
    @State private var flame3 = CGSize(width: 1, height: 0.8)
    
    @State private var offset = 0.0
    @State private var rotation = -40.0
    
    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.flame3)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .scaleEffect(accessibilityReduceMotion ? CGSize(width: 1, height: 1) : flame3, anchor: .bottom)
                Image(.flame2)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .scaleEffect(accessibilityReduceMotion ? CGSize(width: 1, height: 1) : flame2, anchor: .bottom)
                Image(systemName: "pc")
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 2)
                    .rotationEffect(.degrees(rotation))
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, geometry.size.width / 5)
                    .padding()
                    .offset(y: accessibilityReduceMotion ? 0 : offset)
                Image(.flame1)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .scaleEffect(accessibilityReduceMotion ? CGSize(width: 1, height: 1) : flame1, anchor: .bottom)
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .padding([.horizontal, .bottom], -32)
            .padding(.bottom, -21)
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .onAppear {
            withAnimation(.easeInOut(duration: 3).repeatForever()) {
                rotation = -20
            }
            withAnimation(.easeInOut(duration: 2.2).repeatForever()) {
                offset = 21
            }
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                flame1 = CGSize(width: 1.4, height: 0.9)
            }
            
            withAnimation(.easeInOut(duration: 1).repeatForever()) {
                flame2 = CGSize(width: 0.9, height: 1.3)
            }
            
            withAnimation(.easeInOut(duration: 1.5).repeatForever()) {
                flame3 = CGSize(width: 1.3, height: 1.2)
            }
        }
        .accessibilityHidden(true)
    }
}

#Preview {
    ErrorFlameView()
}
