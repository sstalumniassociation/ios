//
//  NewsManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import Foundation

class NewsManager: ObservableObject {
    @Published var articles: [NewsArticle] = [.sample, .sample]
}
