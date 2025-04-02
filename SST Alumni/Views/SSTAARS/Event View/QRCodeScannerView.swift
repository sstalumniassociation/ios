//
//  QRCodeScannerView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import SwiftUI
import AVFoundation
import CodeScanner

struct QRCodeScannerView: View {
    
    @State private var isScanningDown = false
    @State private var isExpanding = false
    @State private var isPresented = false
    
    @Environment(\.dismiss) var dismiss
    
    var completionHandler: ((String) -> Void)
    
    var body: some View {
        ZStack {
            Group {
                CodeScannerView(codeTypes: [.qr], simulatedData: "https://www.sst.edu.sg") { result in
                    switch result {
                    case .success(let success):
                        dismiss()
                        completionHandler(success.string)
                    case .failure(let failure):
                        print(failure)
                    }
                }
                .accessibilityElement()
                .accessibilityLabel("Point at an attendee's QR code to check them in")
                
                if isPresented {
                    GeometryReader { reader in
                        let rectanglePath = Rectangle()
                            .path(in: CGRect(origin: .zero, size: reader.size))
                            .cgPath
                        
                        let squareWidth = min(reader.size.width, reader.size.height) - 64
                        
                        let xOffset = (reader.size.width - squareWidth) / 2
                        
                        let yOffset = 64.0
                        
                        let roundedPath = RoundedRectangle(cornerRadius: squareWidth / 6)
                            .path(in: CGRect(x: xOffset, y: yOffset,
                                             width: squareWidth,
                                             height: squareWidth)).cgPath
                        
                        Path(rectanglePath.subtracting(roundedPath))
                            .fill(.ultraThinMaterial)
                        
                        RoundedRectangle(cornerRadius: squareWidth / 6)
                            .stroke(.blue, style: .init(lineWidth: 3))
                            .offset(x: xOffset, y: yOffset)
                            .frame(width: squareWidth, height: squareWidth)
                        
                        let animatingSquareWidth = squareWidth * (isExpanding ? 1.5 : 1)
                        
                        RoundedRectangle(cornerRadius: animatingSquareWidth / 6)
                            .stroke(.blue.opacity(0.5), style: .init(lineWidth: 3))
                            .offset(x: (reader.size.width - animatingSquareWidth) / 2,
                                    y: 64 - (animatingSquareWidth - squareWidth) / 2)
                            .frame(width: animatingSquareWidth, height: animatingSquareWidth)
                            .opacity(isExpanding ? 0 : 1)
                        
                        Rectangle()
                            .fill(.blue)
                            .frame(height: 8)
                            .offset(y: isScanningDown ? yOffset : yOffset + squareWidth)
                    }
                }
            }
            .ignoresSafeArea()
            
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
        .onAppear {
            Task {
                try? await Task.sleep(for: .seconds(0.1))
                withAnimation {
                    isPresented = true
                }
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    isScanningDown.toggle()
                }
                withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                    isExpanding.toggle()
                }
            }
        }
    }
}
