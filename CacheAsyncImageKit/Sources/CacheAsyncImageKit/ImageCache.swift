//
//  ImageCache.swift
//  CacheAsyncImageKit
//
//  Created by Jia Chen Yee on 4/2/25.
//

import Foundation
import Observation
import SwiftUI

@available(iOS 17.0, *)
@MainActor
@Observable
class ImageCache: Sendable {
    var images: [URL: Image] = [:]
    
    @MainActor static let shared = ImageCache()
    
    func image(for url: URL) async -> Result<Image, ImageCacheError> {
        if let image = images[url] {
            return .success(image)
        }
        
        let data: Data
        let response: URLResponse
        
        do {
            (data, response) = try await URLSession.shared.data(from: url)
        } catch {
            return .failure(ImageCacheError.other(error.localizedDescription))
        }
        
        guard let response = response as? HTTPURLResponse else { return .failure(.badServerResponse) }
        
        guard response.statusCode == 200 else {
            if response.statusCode == 404 {
                return .failure(.notFound)
            } else {
                return .failure(.other("Server error: \(response.statusCode)"))
            }
        }
        
        guard let image = decodeImage(from: data) else { return .failure(.failedToDecode) }
        
        images[url] = image
        
        return .success(image)
    }
}
