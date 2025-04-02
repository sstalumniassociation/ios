//
//  AuthErrorDescription+OnboardingErrors.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import Foundation

extension AuthErrorDescription {
    static let unhandledStatusCode = AuthErrorDescription(icon: "number",
                                                                              title: "Unexpected Status Code",
                                                                              description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let noInternet = AuthErrorDescription(icon: "wifi.slash",
                                                                     title: "Could Not Connect",
                                                                     description: "The connection appears to be offline.")
    
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
}
