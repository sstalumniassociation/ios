//
//  ConditionalLink.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 22/9/23.
//

import Foundation
import SwiftUI

struct ConditionalLink<Content: View, SheetContent: View>: View {
    
    var actionURL: URL?
    var ctaTitle: String?
    
    @ViewBuilder
    var content: (() -> Content)
    
    @ViewBuilder
    var sheetContent: (() -> SheetContent)
    
    @State private var isContentSheetPresented = false
    
    var body: some View {
        if let actionURL, let ctaTitle {
            Link(destination: actionURL) {
                VStack(spacing: 0) {
                    content()
                    
                    Divider()
                    
                    HStack {
                        Text(ctaTitle)
                        Spacer()
                        Image(systemName: "safari")
                    }
                    .foregroundStyle(.blue)
                    .padding()
                }
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(uiColor: .systemGray6))
                }
            }
            .buttonStyle(.plain)
        } else if let ctaTitle {
            Button {
                isContentSheetPresented.toggle()
            } label: {
                VStack(spacing: 0) {
                    content()
                    
                    Divider()
                    
                    HStack {
                        Text(ctaTitle)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.blue)
                    .padding()
                }
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(uiColor: .systemGray6))
                }
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isContentSheetPresented) {
                sheetContent()
            }
        }
    }
}
