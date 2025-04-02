//
//  NewsArticleSectionView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct NewsArticleSectionView: View {
    
    @State private var newsManager = NewsManager()
    
    var body: some View {
        HStack {
            Image(systemName: "newspaper")
            Text("What’s Happening")
        }
        .font(.headline)
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("What’s Happening heading")
        
        VStack {
            ForEach(newsManager.articles) { article in
                NewsArticleView(article: article)
            }
        }
        .padding([.horizontal, .bottom])
        .task {
            await newsManager.loadArticles()
        }
    }
}

#Preview {
    NewsArticleSectionView()
}
