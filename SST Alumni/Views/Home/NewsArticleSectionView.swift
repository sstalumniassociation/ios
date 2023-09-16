//
//  NewsArticleSectionView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct NewsArticleSectionView: View {
    var body: some View {
        HStack {
            Image(systemName: "newspaper")
            Text("What’s Happening")
        }
        .font(.headline)
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        
        VStack {
            NewsArticleView(article: NewsArticle(title: "SST Homecoming 2024", description: "Registration is now open! See you on 24 January 2024, Wednesday!", ctaTitle: "Learn More & Register", ctaURL: URL(string: "https://sst.edu.sg")!))
            
            NewsArticleView(article: NewsArticle(title: "SST Homecoming 2024", description: "Registration is now open! See you on 24 January 2024, Wednesday!", ctaTitle: "Learn More & Register", ctaURL: URL(string: "https://sst.edu.sg")!))
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    NewsArticleSectionView()
}
