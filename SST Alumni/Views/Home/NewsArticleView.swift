//
//  NewsArticleView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct NewsArticleView: View {
    
    var article: NewsArticle
    
    var body: some View {
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
                
                Link(destination: article.ctaURL) {
                    Text("Learn More & Register")
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
    }
}
