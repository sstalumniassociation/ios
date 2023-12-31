//
//  SSTEmailRegex.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 19/9/23.
//

import Foundation
import RegexBuilder

func isValid(email: String) -> Bool {
    let emailRegex = Regex {
        OneOrMore {
            CharacterClass(
                .anyOf("._%+-"),
                .digit,
                .generalCategory(.uppercaseLetter),
                .generalCategory(.lowercaseLetter)
            )
        }
        "@"
        OneOrMore {
            CharacterClass(
                .anyOf(".-"),
                .digit,
                .generalCategory(.uppercaseLetter),
                .generalCategory(.lowercaseLetter)
            )
        }
        "."
        Repeat(2...64) {
            CharacterClass(
                .generalCategory(.uppercaseLetter),
                .generalCategory(.lowercaseLetter)
                
            )
        }
    }
    
    return (try? emailRegex.wholeMatch(in: email)) != nil
}

func extractInformation(fromSSTEmail sstEmail: String) -> SSTEmailValidationState {
    
    let nameReference = Reference(String.self)
    let entryYearReference = Reference(Int?.self)
    
    let sstEmailRegex = Regex {
        Anchor.startOfLine
        Capture(as: nameReference) {
            ZeroOrMore {
                OneOrMore(.word)
                "_"
            }
            OneOrMore(.word)
        } transform: { name in
            name.replacingOccurrences(of: "_", with: " ").capitalized
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
        let name = result[nameReference]
        
        if let entryYear = result[entryYearReference] {
            return .student(name, entryYear)
        } else {
            return .staff(name)
        }
    } else {
        return .invalid
    }
}
