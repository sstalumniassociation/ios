//
//  NewsArticleView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI
import CacheAsyncImageKit

struct NewsArticleView: View {
    
    var article: NewsArticle
    
    var body: some View {
        VStack(spacing: 0) {
            if let heroImage = article.heroImageURL {
                Rectangle()
                    .fill(.clear)
                    .aspectRatio(2/1, contentMode: .fit)
                    .background {
                        CacheAsyncImage(url: heroImage) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .accessibilityElement()
                    .accessibilityLabel(article.heroImageAlt ?? "Hero Image")
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(markdown: article.description)
                
                Link(destination: article.ctaURL) {
                    Text(article.ctaTitle)
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
