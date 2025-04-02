//
//  CacheDefaultErrorView.swift
//  CacheAsyncImageKit
//
//  Created by Jia Chen Yee on 4/2/25.
//

import Foundation
import SwiftUI

public struct CacheDefaultErrorView: View {
    
    var error: ImageCacheError
    
    public var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.yellow)
                .font(.title)
            Text(error.localizedDescription)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
