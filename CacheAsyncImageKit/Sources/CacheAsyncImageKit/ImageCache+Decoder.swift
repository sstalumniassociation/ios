//
//  ImageCache+Decoder.swift
//  CacheAsyncImageKit
//
//  Created by Jia Chen Yee on 4/2/25.
//

import Foundation

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

@available(iOS 17.0, *)
extension ImageCache {
    public func decodeImage(from data: Data) -> Image? {
#if canImport(UIKit)
        if let image = UIImage(data: data) {
            return Image(uiImage: image)
        }
#elseif canImport(AppKit)
        if let image = NSImage(data: data) {
            return Image(nsImage: image)
        }
#endif
        return nil
    }
}
