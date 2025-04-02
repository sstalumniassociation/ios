//
//  CacheAsyncImage.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 4/2/25.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
public struct CacheAsyncImage<Content: View, Placeholder: View, ErrorView: View>: View {
    var url: URL
    
    @ViewBuilder
    var content: (Image) -> Content
    
    @ViewBuilder
    var placeholder: () -> Placeholder
    
    @ViewBuilder
    var errorView: (ImageCacheError) -> ErrorView
    
    public init(url: URL,
                @ViewBuilder content: @escaping (Image) -> Content,
                @ViewBuilder placeholder: @escaping () -> Placeholder,
                @ViewBuilder error errorView: @escaping (ImageCacheError) -> ErrorView) {
        self.url = url
        self.content = content
        self.placeholder = placeholder
        self.errorView = errorView
        
        if let image = cache.hit(for: url) {
            result = .success(image)
        }
    }
    
    public init(url: URL,
                @ViewBuilder content: @escaping (Image) -> Content,
                @ViewBuilder placeholder: @escaping () -> Placeholder) where ErrorView == CacheDefaultErrorView {
        self.url = url
        self.content = content
        self.placeholder = placeholder
        self.errorView = {
            CacheDefaultErrorView(error: $0)
        }
        
        if let image = cache.hit(for: url) {
            result = .success(image)
        }
    }
    
    @State private var cache = ImageCache.shared
    
    @State private var result: Result<Image, ImageCacheError>?
    
    public var body: some View {
        if let result {
            switch result {
            case .success(let image):
                content(image)
            case .failure(let error):
                errorView(error)
            }
        } else {
            placeholder()
                .task {
                    result = await cache.image(for: url)
                }
        }
    }
}
