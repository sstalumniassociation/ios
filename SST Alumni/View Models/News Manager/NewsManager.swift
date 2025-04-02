//
//  NewsManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import Foundation
import FirebaseAuth
import Observation
import OSLog

@MainActor
@Observable
class NewsManager {
    
    var articles: [NewsArticle] = [] {
        didSet {
            writeToCache()
        }
    }
    
    init() {
        loadArticlesFromCache()
    }
    
    func loadArticles() async {
        do {
            guard let token = try await Auth.auth().currentUser?.getIDToken() else {
                return
            }
            
            var request = URLRequest(url: .cfServer.appendingPathComponent("Article"))
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print(response)
            
            let decoder = JSONDecoder()
            let decodedArticles = try decoder.decode([NewsArticle].self, from: data)
            
            self.articles = decodedArticles
        } catch {
            Self.logger.warning("Failed to load articles")
            Self.logger.error("\(error.localizedDescription)")
        }
    }
}
