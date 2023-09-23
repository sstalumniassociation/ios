//
//  NewsManager.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import Foundation
import FirebaseAuth

class NewsManager: ObservableObject {
    @Published var articles: [NewsArticle] = []
    
    func loadArticles() async {
        do {
            
            print("Load")
            guard let token = try await Auth.auth().currentUser?.getIDToken() else {
                print("FAIL")
                return
            }
            
            var request = URLRequest(url: .cfServer.appendingPathComponent("news"))
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            print("hello", String(data: data, encoding: .utf8))
            
            let decoder = JSONDecoder()
            let articles = try decoder.decode([NewsArticle].self, from: data)
            
            print("retrieved", articles)
            
            await MainActor.run {
                self.articles = articles
            }
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}
