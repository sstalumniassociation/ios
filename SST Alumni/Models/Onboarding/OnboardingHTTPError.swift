//
//  OnboardingHTTPError.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 21/9/23.
//

import Foundation

enum OnboardingHTTPError: Error {
    
    case noFirebaseUser
    case couldNotGetToken
    case unexpectedHTTPResponseFormat
    case httpError(Error)
    case decodingError(Error)
    case encodingError(Error)
    
    case firebaseError(Error)
    
    case internalServerError
    case unexpectedStatusCode
    
    case incorrectPassword
    
    case somethingWentHorriblyWrong
    
    var wrappedError: Error? {
        switch self {
        case .noFirebaseUser, .couldNotGetToken, .unexpectedHTTPResponseFormat, .internalServerError, .unexpectedStatusCode, .incorrectPassword, .somethingWentHorriblyWrong: nil
        case .httpError(let error),
                .decodingError(let error),
                .encodingError(let error), .firebaseError(let error): error
        }
    }
}
