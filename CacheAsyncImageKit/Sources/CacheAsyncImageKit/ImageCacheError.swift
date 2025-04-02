//
//  ImageCacheError.swift
//  CacheAsyncImageKit
//
//  Created by Jia Chen Yee on 4/2/25.
//

import Foundation

public enum ImageCacheError: Error {
    case badServerResponse
    case notFound
    case other(String)
    case failedToDecode
}

extension ImageCacheError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badServerResponse:
            return "Bad server response"
        case .notFound:
            return "Image not found"
        case .other(let string):
            return string
        case .failedToDecode:
            return "Failed to decode image"
        }
    }
}
