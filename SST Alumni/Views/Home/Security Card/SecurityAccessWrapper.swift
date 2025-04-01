//
//  SecurityAccessWrapper.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 4/1/25.
//

import SwiftUI

struct SecurityAccessWrapper<Content: View>: View {
    
    @Binding var tab: AppState
    
    @ViewBuilder
    var content: () -> Content
    
    @Environment(UserManager.self) private var userManager
    
    @State private var isCardExpanded = false
    
    @Namespace private var namespace
    
    @State private var isConfettiAnimating = false
    
    var body: some View {
        ZStack {
            ConfettiBackgroundView(isCardExpanded: isCardExpanded, isConfettiAnimating: isConfettiAnimating)
            
            ScrollView {
                if !isCardExpanded {
                    Button {
                        if SecurityAccessManager.isEnabled {
                            if userManager.user?.memberType != .revoked {
                                withAnimation(.easeInOut) {
                                    isCardExpanded = true
                                }
                            }
                        } else {
                            tab = .profile
                        }
                    } label: {
                        VStack(spacing: 0) {
                            CardView(namespace: namespace, user: userManager.user)
                            
                            if SecurityAccessManager.isEnabled {
                                VStack(alignment: .leading) {
                                    if userManager.user?.memberType != .revoked {
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
                    
                    content()
                } else {
                    if let user = userManager.user {
                        CardExpandedView(isConfettiAnimating: $isConfettiAnimating,
                                         isCardExpanded: $isCardExpanded,
                                         user: user, namespace: namespace)
                    } else {
                        Text("An unexpected error occurred. Please try again later.")
                    }
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
