//
//  NewsArticle.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

struct NewsArticle: Identifiable {
    var title: String
    var description: String
    
    var heroImageAlt: URL?
    var heroImageURL: URL?
    
    var ctaTitle: String
    var ctaURL: URL
    
    static let sample = NewsArticle(title: "SST Homecoming 2024", description: "Registration is now open! See you on 24 January 2024, Wednesday!", ctaTitle: "Learn More & Register", ctaURL: URL(string: "https://sst.edu.sg")!)
    
    var id: String {
        title + description
    }
}
