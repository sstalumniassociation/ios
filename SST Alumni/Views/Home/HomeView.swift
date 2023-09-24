//
//  HomeView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI
import ScreenCaptureRedaction

struct HomeView: View {
    
    var user: UserData
    
    @State private var isCardExpanded = false
    
    @Namespace var namespace
    
    @State private var isConfettiAnimating = false
    
    var body: some View {
        ZStack {
            if isCardExpanded && isConfettiAnimating {
                ScreenCaptureRedactionView {
                    GeometryReader { geometry in
                        ConfettiView(size: geometry.size)
                    }
                } replacingWith: {
                    Rectangle()
                        .opacity(0)
                }
            }
            
            ScrollView {
                if !isCardExpanded {
                    Button {
                        if user.memberType != .revoked {
                            withAnimation(.easeInOut) {
                                isCardExpanded = true
                            }
                        }
                    } label: {
                        VStack(spacing: 0) {
                            CardView(namespace: namespace, user: user)
                            
                            VStack(alignment: .leading) {
                                if user.memberType != .revoked {
                                    Text("Coming Back?")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("Tap on this card and present it to the security at the front gate.")
                                } else {
                                    Text("Contact SST Alumni Association")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Text("If you intend on returning to SST as an alumnus, email [alumni@sstaa.org](mailto:alumni@sstaa.org).")
                                }
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
                    .accessibilityLabel("Security Card")
                    
                    NewsArticleSectionView()
                } else {
                    CardExpandedView(isConfettiAnimating: $isConfettiAnimating, isCardExpanded: $isCardExpanded, user: user, namespace: namespace)
                }
            }
            
            if isCardExpanded {
                Button {
                    withAnimation(.easeInOut) {
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
