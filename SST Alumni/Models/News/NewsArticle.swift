//
//  NewsArticle.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import Foundation

struct NewsArticle: Codable, Identifiable {
    var id: String
    
    var title: String
    var description: String
    
    var heroImageAlt: String?
    var heroImageURL: URL?
    
    var ctaTitle: String
    var ctaURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case heroImageAlt
        case heroImageURL = "heroImageUrl"
        case ctaTitle
        case ctaURL = "ctaUrl"
    }
    
    static let sample = NewsArticle(id: "test", title: "SST Homecoming 2024", description: "Registration is now open! See you on 24 January 2024, Wednesday!", ctaTitle: "Learn More & Register", ctaURL: URL(string: "https://sst.edu.sg")!)
}
