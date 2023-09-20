//
//  AuthErrorHandle+FirebaseErrors.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import Foundation

extension AuthErrorHandle {
    static func fromFirebaseAccount(_ errorCode: Int) -> AuthErrorHandle? {
        switch errorCode {
        case 17000: Self.invalidCustomToken
        case 17002: Self.customTokenMismatch
        case 17004: Self.invalidCredential
        case 17005: Self.userDisabled
        case 17006: Self.operationNotAllowed
        case 17007: Self.emailAlreadyInUse
        case 17008: Self.invalidEmail
        case 17009: Self.wrongPassword
        case 17010: Self.tooManyRequests
        case 17011: Self.userNotFound
        case 17012: Self.accountExistsWithDifferentCredential
        case 17014: Self.requiresRecentLogin
        case 17015: Self.providerAlreadyLinked
        case 17016: Self.noSuchProvider
        case 17017: Self.invalidUserToken
        case 17020: Self.networkError
        case 17021: Self.userTokenExpired
        case 17023: Self.invalidAPIKey
        case 17024: Self.userMismatch
        case 17025: Self.credentialAlreadyInUse
        case 17026: Self.weakPassword
        case 17028: Self.appNotAuthorized
        case 17029: Self.expiredActionCode
        case 17030: Self.invalidActionCode
        case 17031: Self.invalidMessagePayload
        case 17032: Self.invalidSender
        case 17033: Self.invalidRecipientEmail
        case 17034: Self.missingEmail
        case 17036: Self.missingIosBundleID
        case 17037: Self.missingAndroidPackageName
        case 17038: Self.unauthorizedDomain
        case 17039: Self.invalidContinueURI
        case 17040: Self.missingContinueURI
        case 17041: Self.missingPhoneNumber
        case 17042: Self.invalidPhoneNumber
        case 17043: Self.missingVerificationCode
        case 17044: Self.invalidVerificationCode
        case 17045: Self.missingVerificationID
        case 17046: Self.invalidVerificationID
        case 17047: Self.missingAppCredential
        case 17048: Self.invalidAppCredential
        case 17051: Self.sessionExpired
        case 17052: Self.quotaExceeded
        case 17053: Self.missingAppToken
        case 17054: Self.notificationNotForwarded
        case 17055: Self.appNotVerified
        case 17056: Self.captchaCheckFailed
        case 17057: Self.webContextAlreadyPresented
        case 17058: Self.webContextCancelled
        case 17059: Self.appVerificationUserInteractionFailure
        case 17060: Self.invalidClientID
        case 17061: Self.webNetworkRequestFailed
        case 17062: Self.webInternalError
        case 17063: Self.webSignInUserInteractionFailure
        case 17066: Self.localPlayerNotAuthenticated
        case 17067: Self.nullUser
        case 17068: Self.dynamicLinkNotActivated
        case 17071: Self.invalidProviderID
        case 17072: Self.tenantIDMismatch
        case 17073: Self.unsupportedTenantOperation
        case 17074: Self.invalidDynamicLinkDomain
        case 17075: Self.rejectedCredential
        case 17076: Self.gameKitNotLinked
        case 17078: Self.secondFactorRequired
        case 17081: Self.missingMultiFactorSession
        case 17082: Self.missingMultiFactorInfo
        case 17083: Self.invalidMultiFactorSession
        case 17084: Self.multiFactorInfoNotFound
        case 17085: Self.adminRestrictedOperation
        case 17086: Self.unverifiedEmail
        case 17087: Self.secondFactorAlreadyEnrolled
        case 17088: Self.maximumSecondFactorCountExceeded
        case 17089: Self.unsupportedFirstFactor
        case 17090: Self.emailChangeNeedsVerification
        case 17093: Self.missingClientIdentifier
        case 17094: Self.missingOrInvalidNonce
        case 17105: Self.blockingCloudFunctionError
        case 17200: Self.recaptchaNotEnabled
        case 17201: Self.missingRecaptchaToken
        case 17202: Self.invalidRecaptchaToken
        case 17203: Self.invalidRecaptchaAction
        case 17204: Self.missingClientType
        case 17205: Self.missingRecaptchaVersion
        case 17206: Self.invalidRecaptchaVersion
        case 17207: Self.invalidReqType
        case 17208: Self.recaptchaSDKNotLinked
        case 17995: Self.keychainError
        case 17999: Self.internalError
        case 18000: Self.malformedJWT
        default: nil
        }
    }
    
    static let invalidCustomToken = AuthErrorHandle(icon: "key.slash",
                                                    title: "Invalid Custom Token",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let customTokenMismatch = AuthErrorHandle(icon: "key.slash",
                                                     title: "Custom Token Mismatch",
                                                     description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidCredential = AuthErrorHandle(icon: "key.slash",
                                                   title: "Invalid Credential",
                                                   description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let userDisabled = AuthErrorHandle(icon: "lock",
                                              title: "Account Disabled",
                                              description: "Your account has been disabled. Contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let operationNotAllowed = AuthErrorHandle(icon: "lock",
                                                     title: "Sign In Disabled",
                                                     description: "This method of sign in is no longer supported. Contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let emailAlreadyInUse = AuthErrorHandle(icon: "envelope.badge.person.crop",
                                                   title: "Email Already In Use",
                                                   description: "There’s already an account connected to this email. Contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidEmail = AuthErrorHandle(icon: "questionmark.bubble",
                                              title: "Invalid Email",
                                              description: "Please check that the email address provided is entered correctly.")
    
    static let wrongPassword = AuthErrorHandle(icon: "ellipsis.rectangle",
                                               title: "Incorrect Password",
                                               description: "Incorrect password. You can retry or reset password.")
    
    static let tooManyRequests = AuthErrorHandle(icon: "arrow.left.arrow.right",
                                                 title: "Too Many Requests",
                                                 description: "Access is temporarily disabled due to many failed login attempts. Try again later, or reset your password. If this issue persists, please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let userNotFound = AuthErrorHandle(icon: "person.crop.circle.badge.questionmark",
                                              title: "User Not Found",
                                              description: "Could not find linked authentication account. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let accountExistsWithDifferentCredential = AuthErrorHandle(icon: "eyes",
                                                                      title: "Account Exists with Different Credentials",
                                                                      description: "Your account is linked to another sign in method. Please sign in using that method, or contact us at [app@sstaa.org](mailto:app@sstaa.org) to change it.")
    
    static let requiresRecentLogin = AuthErrorHandle(icon: "lock",
                                                     title: "Login Required",
                                                     description: "Looks like you changed your password recently.")
    
    static let providerAlreadyLinked = AuthErrorHandle(icon: "link",
                                                       title: "Login Method Already Linked",
                                                       description: "Looks like you have the login method already linked.")
    
    static let noSuchProvider = AuthErrorHandle(icon: "person.fill.questionmark",
                                                title: "Login Method Not Found",
                                                description: "We can't unlink a login method that… isn't linked.")
    
    static let invalidUserToken = AuthErrorHandle(icon: "lock",
                                                  title: "Login Required",
                                                  description: "Invalid user token.")
    
    static let networkError = AuthErrorHandle(icon: "wifi.slash",
                                              title: "Network Error",
                                              description: "Could not connect to authentication service. Please retry.")
    
    static let userTokenExpired = AuthErrorHandle(icon: "clock.arrow.circlepath",
                                                  title: "Session Expired",
                                                  description: "Your session has expired. Please log in again.")
    
    static let invalidAPIKey = AuthErrorHandle(icon: "key.slash",
                                               title: "Invalid API Key",
                                               description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let userMismatch = AuthErrorHandle(icon: "person.badge.minus",
                                              title: "User Mismatch",
                                              description: "Attempted to reauthenticate with a different user. Please try again with the correct user.")
    
    static let credentialAlreadyInUse = AuthErrorHandle(icon: "link.circle",
                                                        title: "Credential Already Linked",
                                                        description: "The credential is already linked with a different account. Please try a different credential.")
    
    static let weakPassword = AuthErrorHandle(icon: "eyes",
                                              title: "Weak Password",
                                              description: "The password provided is too weak. Please choose a stronger password.")
    
    static let appNotAuthorized = AuthErrorHandle(icon: "xmark.shield",
                                                  title: "App Not Authorized",
                                                  description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let expiredActionCode = AuthErrorHandle(icon: "timer",
                                                   title: "Expired Code",
                                                   description: "The action code has expired. Please request a new one.")
    
    static let invalidActionCode = AuthErrorHandle(icon: "key.slash",
                                                   title: "Invalid Code",
                                                   description: "The action code is invalid. Please check and try again.")
    
    static let invalidMessagePayload = AuthErrorHandle(icon: "envelope.badge",
                                                       title: "Invalid Message Payload",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidSender = AuthErrorHandle(icon: "envelope.badge.person.crop.fill",
                                               title: "Invalid Password Reset Email",
                                               description: "The email is invalid. Please check and try again.")
    
    static let invalidRecipientEmail = AuthErrorHandle(icon: "envelope.badge.person.crop.fill",
                                                       title: "Invalid Recipient Email",
                                                       description: "The recipient email address is invalid. Please check and try again.")
    
    static let missingEmail = AuthErrorHandle(icon: "envelope.arrow.triangle.branch",
                                              title: "Missing Email",
                                              description: "An email address is required but not provided. Please enter an email address.")
    
    static let missingIosBundleID = AuthErrorHandle(icon: "iphone.slash",
                                                    title: "Missing iOS Bundle ID",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingAndroidPackageName = AuthErrorHandle(icon: "flipphone",
                                                           title: "Missing Android Package Name",
                                                           description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let unauthorizedDomain = AuthErrorHandle(icon: "xmark.shield",
                                                    title: "Unauthorized Domain",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidContinueURI = AuthErrorHandle(icon: "link.circle",
                                                    title: "Invalid Continue URL",
                                                    description: "The continue URL provided is not valid. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingContinueURI = AuthErrorHandle(icon: "link.circle",
                                                    title: "Missing Continue URL",
                                                    description: "A continue URL was not provided where required. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingPhoneNumber = AuthErrorHandle(icon: "number",
                                                    title: "Missing Phone Number",
                                                    description: "A phone number is required but was not provided. Please enter a phone number and try again.")
    
    static let invalidPhoneNumber = AuthErrorHandle(icon: "phone",
                                                    title: "Invalid Phone Number",
                                                    description: "The phone number provided is invalid. Please check and try again.")
    
    static let missingVerificationCode = AuthErrorHandle(icon: "lock.slash",
                                                         title: "Missing Verification Code",
                                                         description: "A verification code is required. Please enter the code and try again.")
    
    static let invalidVerificationCode = AuthErrorHandle(icon: "lock.badge.exclamationmark",
                                                         title: "Invalid Verification Code",
                                                         description: "The verification code provided is invalid. Please check and try again.")
    
    static let missingVerificationID = AuthErrorHandle(icon: "person.text.rectangle",
                                                       title: "Missing Verification ID",
                                                       description: "A verification ID is required but not provided. Please enter the ID and try again.")
    
    static let invalidVerificationID = AuthErrorHandle(icon: "person.text.rectangle",
                                                       title: "Invalid Verification ID",
                                                       description: "The verification ID provided is invalid. Please check and try again.")
    
    static let missingAppCredential = AuthErrorHandle(icon: "app.badge",
                                                      title: "Missing App Credential",
                                                      description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidAppCredential = AuthErrorHandle(icon: "app.badge.exclamationmark",
                                                      title: "Invalid App Credential",
                                                      description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let sessionExpired = AuthErrorHandle(icon: "timer",
                                                title: "Code Expired",
                                                description: "The SMS code has expired. Please request a new code and try again.")
    
    static let quotaExceeded = AuthErrorHandle(icon: "exclamationmark.arrow.circlepath",
                                               title: "Quota Exceeded",
                                               description: "The SMS message quota has been exceeded. Please try again later.")
    
    static let missingAppToken = AuthErrorHandle(icon: "app.badge",
                                                 title: "Missing App Token",
                                                 description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let notificationNotForwarded = AuthErrorHandle(icon: "bell.slash",
                                                          title: "Notification Not Forwarded",
                                                          description: "The app failed to forward the remote notification to Authentication. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let appNotVerified = AuthErrorHandle(icon: "shield.lefthalf.fill",
                                                title: "App Not Verified",
                                                description: "Could not verify the app during phone number authentication. Please check your verification setup and try again.")
    
    static let captchaCheckFailed = AuthErrorHandle(icon: "xmark.shield",
                                                    title: "Captcha Check Failed",
                                                    description: "The reCAPTCHA token is invalid. Please try the verification process again.")
    
    static let webContextAlreadyPresented = AuthErrorHandle(icon: "xmark.rectangle",
                                                            title: "Web Context Already Presented",
                                                            description: "A new web context was attempted while one is already presented. Please close the current context and try again.")
    
    static let webContextCancelled = AuthErrorHandle(icon: "xmark.rectangle",
                                                     title: "Web Context Cancelled",
                                                     description: "The URL presentation was cancelled prematurely. Please try again.")
    
    static let appVerificationUserInteractionFailure = AuthErrorHandle(icon: "exclamationmark.triangle",
                                                                       title: "App Verification Failure",
                                                                       description: "Something went wrong while verifying the app. Please try again. If this issue persists, contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidClientID = AuthErrorHandle(icon: "person.badge.exclamationmark",
                                                 title: "Invalid Client ID",
                                                 description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let webNetworkRequestFailed = AuthErrorHandle(icon: "cloud",
                                                         title: "Network Request Failed",
                                                         description: "A network request failed during the web sign-in process. Please check your connection and try again.")
    
    static let webInternalError = AuthErrorHandle(icon: "exclamationmark.triangle",
                                                  title: "Web Internal Error",
                                                  description: "An internal error occurred. Please try again.")
    
    static let webSignInUserInteractionFailure = AuthErrorHandle(icon: "person.badge.exclamationmark",
                                                                 title: "Web Sign-In Failure",
                                                                 description: "A general failure occurred during the web sign-in process. Please try again.")
    
    static let localPlayerNotAuthenticated = AuthErrorHandle(icon: "person.crop.circle.badge.exclamationmark",
                                                             title: "Local Player Not Authenticated",
                                                             description: "Local player was not authenticated before attempting Game Center sign-in. Ensure you are signed into Game Center and try again.")
    
    static let nullUser = AuthErrorHandle(icon: "person.fill.questionmark",
                                          title: "Do you exist?",
                                          description: "The user returned null. This is odd. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let dynamicLinkNotActivated = AuthErrorHandle(icon: "link",
                                                         title: "Could Not Generate Link",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidProviderID = AuthErrorHandle(icon: "person.badge.minus",
                                                   title: "Invalid Provider ID",
                                                   description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let tenantIDMismatch = AuthErrorHandle(icon: "arrow.left.arrow.right",
                                                  title: "Tenant ID Mismatch",
                                                  description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let unsupportedTenantOperation = AuthErrorHandle(icon: "building.columns",
                                                            title: "Unsupported Tenant Operation",
                                                            description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidDynamicLinkDomain = AuthErrorHandle(icon: "link",
                                                          title: "Invalid Domain",
                                                          description: "The domain is not configured or unauthorized for this app. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let rejectedCredential = AuthErrorHandle(icon: "xmark.octagon",
                                                    title: "Rejected Credential",
                                                    description: "The credential provided was rejected due to being misformed or mismatching. Please check the credentials and try again.")
    
    static let gameKitNotLinked = AuthErrorHandle(icon: "gamecontroller.fill",
                                                  title: "GameKit Not Linked",
                                                  description: "GameKit framework is not linked. Ensure it is properly linked and try again.")
    
    static let secondFactorRequired = AuthErrorHandle(icon: "shield.lefthalf.fill",
                                                      title: "Second Factor Required",
                                                      description: "Sign in requires a second factor authentication. Please complete the two-step verification and try again.")
    
    static let missingMultiFactorSession = AuthErrorHandle(icon: "person.crop.circle.badge.exclamationmark",
                                                           title: "Missing Multi-Factor Session",
                                                           description: "The multi-factor session is missing. Please sign in again.")
    
    static let missingMultiFactorInfo = AuthErrorHandle(icon: "person.crop.circle.badge.questionmark",
                                                        title: "Missing Multi Factor Info",
                                                        description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidMultiFactorSession = AuthErrorHandle(icon: "exclamationmark.octagon",
                                                           title: "Invalid Multi Factor Session",
                                                           description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let multiFactorInfoNotFound = AuthErrorHandle(icon: "magnifyingglass",
                                                         title: "Multi Factor Info Not Found",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let adminRestrictedOperation = AuthErrorHandle(icon: "shield.lefthalf.fill",
                                                          title: "Admin Restricted Operation",
                                                          description: "The operation is restricted to admins only. Please check your permissions and try again.")
    
    static let unverifiedEmail = AuthErrorHandle(icon: "envelope.badge",
                                                 title: "Unverified Email",
                                                 description: "The email address has not been verified. Please verify your email address and try again.")
    
    static let secondFactorAlreadyEnrolled = AuthErrorHandle(icon: "shield.lefthalf.fill",
                                                             title: "Second Factor Already Enrolled",
                                                             description: "The second factor is already enrolled. Please use a different method or check your setup.")
    
    static let maximumSecondFactorCountExceeded = AuthErrorHandle(icon: "exclamationmark.triangle",
                                                                  title: "Maximum Second Factor Count Exceeded",
                                                                  description: "The maximum number of second factors has been exceeded. Please remove an existing factor before adding a new one.")
    
    static let unsupportedFirstFactor = AuthErrorHandle(icon: "xmark.shield",
                                                        title: "Unsupported First Factor",
                                                        description: "The first factor is not supported. Please choose a supported authentication method.")
    
    static let emailChangeNeedsVerification = AuthErrorHandle(icon: "envelope.badge",
                                                              title: "Email Change Needs Verification",
                                                              description: "A verified email is required to complete the email change. Please verify the new email address.")
    
    static let missingClientIdentifier = AuthErrorHandle(icon: "exclamationmark.bubble",
                                                         title: "Missing Client Identifier",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingOrInvalidNonce = AuthErrorHandle(icon: "number",
                                                       title: "Missing or Invalid Nonce",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let blockingCloudFunctionError = AuthErrorHandle(icon: "cloud.heavyrain",
                                                            title: "Blocking Cloud Function Error",
                                                            description: "A Cloud Function returned a blocking error. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let recaptchaNotEnabled = AuthErrorHandle(icon: "exclamationmark.triangle",
                                                     title: "reCAPTCHA Not Enabled",
                                                     description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingRecaptchaToken = AuthErrorHandle(icon: "exclamationmark.bubble",
                                                       title: "Missing reCAPTCHA Token",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidRecaptchaToken = AuthErrorHandle(icon: "xmark.shield",
                                                       title: "Invalid reCAPTCHA Token",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidRecaptchaAction = AuthErrorHandle(icon: "xmark.octagon",
                                                        title: "Invalid reCAPTCHA Action",
                                                        description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingClientType = AuthErrorHandle(icon: "exclamationmark.bubble",
                                                   title: "Missing Client Type",
                                                   description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingRecaptchaVersion = AuthErrorHandle(icon: "exclamationmark.bubble",
                                                         title: "Missing reCAPTCHA Version",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidRecaptchaVersion = AuthErrorHandle(icon: "xmark.octagon",
                                                         title: "Invalid reCAPTCHA Version",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidReqType = AuthErrorHandle(icon: "xmark.octagon",
                                                title: "Invalid Request Type",
                                                description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let recaptchaSDKNotLinked = AuthErrorHandle(icon: "link",
                                                       title: "reCAPTCHA SDK Not Linked",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let keychainError = AuthErrorHandle(icon: "key",
                                               title: "Keychain Error",
                                               description: "You may need to log in again.")
    
    static let internalError = AuthErrorHandle(icon: "exclamationmark.circle",
                                               title: "Internal Error",
                                               description: "An internal error occurred. Please try again later.")
    
    static let malformedJWT = AuthErrorHandle(icon: "xmark.bin",
                                              title: "Malformed JWT",
                                              description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
}
