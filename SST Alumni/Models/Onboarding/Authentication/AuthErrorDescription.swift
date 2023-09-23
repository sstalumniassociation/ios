//
//  AuthErrorDescription.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import Foundation


class AuthErrorDescription: Equatable {
    static func == (lhs: AuthErrorDescription, rhs: AuthErrorDescription) -> Bool {
        lhs.title == rhs.title && lhs.description == rhs.description
    }
    
    var icon: String
    
    var title: String
    var description: String
    
    var recoverToState: AuthenticationState?
    
    required
    init(icon: String, title: String, description: String, recoverToState: AuthenticationState? = nil) {
        self.icon = icon
        self.title = title
        self.description = description
        self.recoverToState = recoverToState
    }
    
    static let somethingWentHorriblyWrong = AuthErrorDescription(icon: "pc",
                                                            title: "That’s Unexpected",
                                                            description: "Something has gone horribly wrong.\nPlease contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let couldNotDecodeData = AuthErrorDescription(icon: "doc",
                                                    title: "Could Not Decode Data",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let couldNotEncodeData = AuthErrorDescription(icon: "doc.zipper",
                                                    title: "Could Not Encode Data",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let internalServerError = AuthErrorDescription(icon: "server.rack",
                                                     title: "Internal Server Error",
                                                     description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let unexpectedHTTPResponse = AuthErrorDescription(icon: "flame",
                                                        title: "Unexpected HTTP Response",
                                                        description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let couldNotFindUser = AuthErrorDescription(icon: "eyes",
                                                  title: "Could Not Find User",
                                                  description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let couldNotGetToken = AuthErrorDescription(icon: "ellipsis.rectangle",
                                                  title: "Could Not Get Token",
                                                  description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static func from(_ onboardingError: OnboardingHTTPError) -> AuthErrorDescription {
        switch onboardingError {
        case .noFirebaseUser: .couldNotFindUser
        case .couldNotGetToken: .couldNotGetToken
        case .unexpectedHTTPResponseFormat: .unexpectedHTTPResponse
        case .httpError(let error): AuthErrorDescription(icon: "wifi.slash",
                                                    title: "Could Not Connect",
                                                    description: "\(error.localizedDescription)")
        case .decodingError: .couldNotDecodeData
        case .encodingError: .couldNotEncodeData
        case .firebaseError(let error): fromFirebase((error as NSError).code)!
        case .internalServerError: .internalError
        case .unexpectedStatusCode: AuthErrorDescription(icon: "number",
                                                    title: "Unexpected Status Code",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
        case .incorrectPassword: .wrongPassword
        case .somethingWentHorriblyWrong: .somethingWentHorriblyWrong
        }
    }
}
