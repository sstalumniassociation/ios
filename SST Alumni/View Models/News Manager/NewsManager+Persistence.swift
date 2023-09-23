//
//  NewsManager+Persistence.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import Foundation

extension NewsManager {
    fileprivate func getPersistenceURL() -> URL {
        .documentsDirectory.appending(path: "news-cache.json")
    }
    
    func loadArticlesFromCache() {
        do {
            let data = try Data(contentsOf: getPersistenceURL())
            
            let decoder = JSONDecoder()
            
            let articles = try decoder.decode([NewsArticle].self, from: data)
            
            self.articles = articles
        } catch {
            self.articles = []
        }
    }
    
    func writeToCache() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(articles)
            
            try data.write(to: getPersistenceURL())
        } catch {
            print(error.localizedDescription)
        }
    }
}
