//
//  HomeView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isCardExpanded = false
    
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            ScrollView {
                if !isCardExpanded {
                    Button {
                        withAnimation(.easeInOut) {
                            isCardExpanded = true
                        }
                    } label: {
                        VStack(spacing: 0) {
                            CardView(namespace: namespace, user: .sample)
                            VStack(alignment: .leading) {
                                Text("Coming Back?")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Tap on this card and present it to the security at the front gate.")
                            }
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                        .foregroundStyle(Color(uiColor: .label))
                        .multilineTextAlignment(.leading)
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(uiColor: .systemGray6))
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                    
                    NewsArticleSectionView()
                } else {
                    CardExpandedView(user: .sample, namespace: namespace)
                }
            }
            
            if isCardExpanded {
                Button {
                    withAnimation {
                        isCardExpanded.toggle()
                    }
                } label: {
                    Text("Done")
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding([.horizontal, .bottom])
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

#Preview {
    HomeView()
}
