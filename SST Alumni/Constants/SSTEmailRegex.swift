//
//  SSTEmailRegex.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import Foundation
import RegexBuilder

func extractInformation(fromSSTEmail sstEmail: String) -> SSTEmailValidationState {
    
    let nameReference = Reference(Substring.self)
    let entryYearReference = Reference(Int?.self)
    
    let sstEmailRegex = Regex {
        Anchor.startOfLine
        Capture(as: nameReference) {
            ZeroOrMore {
                OneOrMore(.word)
                "_"
            }
            OneOrMore(.word)
        }
        
        "@"
        
        Optionally {
            "s"
            TryCapture(as: entryYearReference) {
                Repeat(count: 4) {
                    One(.digit)
                }
            } transform: { match in
                Int(match)
            }
            "."
        }
        
        "sst"
        Optionally {
            "s"
        }
        ".edu.sg"
        
        Anchor.endOfLine
    }
    
    if let result = try? sstEmailRegex.wholeMatch(in: sstEmail) {
        let name = String(result[nameReference])
        
        if let entryYear = result[entryYearReference] {
            return .student(name, entryYear)
        } else {
            return .staff(name)
        }
    } else {
        return .invalid
    }
}
