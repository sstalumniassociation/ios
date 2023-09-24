//
//  HexagonView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 25/9/23.
//

import SwiftUI

struct HexagonView: View {
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var date = Date.now
    
    var body: some View {
        GeometryReader { geometry in
            let width: CGFloat = 100
            let centerX = width / 2
            let centerY = width * sqrt(3) / 2 / 2
            let height = centerY + sqrt(3) * width / 4
            let columns: Int = Int(geometry.size.width / width)
            let rows: Int = Int(geometry.size.height / height) * 2 + 3
            
            VStack(spacing: -width * sqrt(3) / 2 / 2) {
                ForEach(0..<rows, id: \.self) { row in
                    HStack(spacing: width / 2) {
                        ForEach(0..<columns, id: \.self) { column in
                            let hexagonSeed = (Int(round(date.timeIntervalSince1970) / 1) + ((column + 1) * (row + 1))) % 10
                            Path { path in
                                path.move(to: CGPoint(x: centerX - width / 4, y: 0))
                                path.addLine(to: CGPoint(x: centerX + width / 4, y: 0))
                                path.addLine(to: CGPoint(x: width, y: centerY))
                                path.addLine(to: CGPoint(x: centerX + width / 4, y: height))
                                path.addLine(to: CGPoint(x: centerX - width / 4, y: height))
                                path.addLine(to: CGPoint(x: 0, y: centerY))
                                
                                path.closeSubpath()
                            }
                            .stroke(hexagonColor(for: hexagonSeed), lineWidth: 8)
                            .frame(width: width, height: height)
                        }
                    }
                    .offset(x: (row % 2 == 0) ? width / 4 * 3 : 0)
                }
            }
            .offset(x: -centerX, y: -centerY)
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
            .aspectRatio(1, contentMode: .fit)
        }
        .onReceive(timer) { date in
            withAnimation {
                self.date = date
            }
        }
    }
    
    func hexagonColor(for seed: Int) -> Color {
        return [.clear, .blue, .clear, .clear, .gray, .blue, .gray, .red, .clear, .red][seed]
    }
}

#Preview {
    HexagonView()
}
