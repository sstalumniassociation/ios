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
                            CardView(namespace: namespace, user: User(name: "Qin Guan", graduationYear: "2020", memberType: .associateMember))
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
                    
                    HStack {
                        Image(systemName: "newspaper")
                        Text("What’s Happening")
                    }
                    .font(.headline)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(.clear)
                            .aspectRatio(2/1, contentMode: .fit)
                            .background {
                                Image(.samplePhoto)
                                    .resizable()
                                    .scaledToFill()
                            }
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        
                        VStack(alignment: .leading) {
                            Text("SST Homecoming 2024")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Registration is now open! See you on 24 January 2024, Wednesday!")
                            
                            Button("Learn More & Register") {
                                
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.top)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(uiColor: .systemGray6))
                    }
                    .padding([.horizontal, .bottom])
                } else {
                    CardExpandedView(user: User(name: "Qin Guan", graduationYear: "2020", memberType: .associateMember), namespace: namespace)
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
