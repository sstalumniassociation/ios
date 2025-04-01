//
//  Constants+URL.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 17/9/23.
//

import Foundation

extension URL {
    #if DEBUG
    static let cfServer = URL(string: "https://sstaa.hotchocolate.app/api/")!
    #else
    static let cfServer = URL(string: "https://sstaa.hotchocolate.app/api/")!
    #endif
    
    static let sstaaSignUp = URL(string: "https://go.sstaa.org/register")!
}
