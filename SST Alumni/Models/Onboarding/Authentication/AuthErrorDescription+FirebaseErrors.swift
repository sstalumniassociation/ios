//
//  AuthErrorDescription+FirebaseErrors.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 20/9/23.
//

import Foundation

extension AuthErrorDescription {
    static let invalidCustomToken = AuthErrorDescription(icon: "key.slash",
                                                    title: "Invalid Custom Token",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let customTokenMismatch = AuthErrorDescription(icon: "key.slash",
                                                     title: "Custom Token Mismatch",
                                                     description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidCredential = AuthErrorDescription(icon: "key.slash",
                                                   title: "Invalid Credential",
                                                   description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let userDisabled = AuthErrorDescription(icon: "lock",
                                              title: "Account Disabled",
                                              description: "Your account has been disabled. Contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let operationNotAllowed = AuthErrorDescription(icon: "lock",
                                                     title: "Sign In Disabled",
                                                     description: "This method of sign in is no longer supported. Contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let emailAlreadyInUse = AuthErrorDescription(icon: "envelope.badge.person.crop",
                                                   title: "Email Already In Use",
                                                   description: "There’s already an account connected to this email. Contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidEmail = AuthErrorDescription(icon: "questionmark.bubble",
                                              title: "Invalid Email",
                                              description: "Please check that the email address provided is entered correctly.")
    
    static let wrongPassword = AuthErrorDescription(icon: "ellipsis.rectangle",
                                               title: "Incorrect Password",
                                               description: "Incorrect password. You can retry or reset password.")
    
    static let tooManyRequests = AuthErrorDescription(icon: "arrow.left.arrow.right",
                                                 title: "Too Many Requests",
                                                 description: "Access is temporarily disabled due to many failed login attempts. Try again later, or reset your password. If this issue persists, please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let userNotFound = AuthErrorDescription(icon: "person.crop.circle.badge.questionmark",
                                              title: "User Not Found",
                                              description: "Could not find linked authentication account. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let accountExistsWithDifferentCredential = AuthErrorDescription(icon: "eyes",
                                                                      title: "Account Exists with Different Credentials",
                                                                      description: "Your account is linked to another sign in method. Please sign in using that method, or contact us at [app@sstaa.org](mailto:app@sstaa.org) to change it.")
    
    static let requiresRecentLogin = AuthErrorDescription(icon: "lock",
                                                     title: "Login Required",
                                                     description: "This operation is sensitive and requires recent authentication.")
    
    static let providerAlreadyLinked = AuthErrorDescription(icon: "link",
                                                       title: "Login Method Already Linked",
                                                       description: "Looks like you have the login method already linked.")
    
    static let noSuchProvider = AuthErrorDescription(icon: "person.fill.questionmark",
                                                title: "Login Method Not Found",
                                                description: "We can't unlink a login method that… isn't linked.")
    
    static let invalidUserToken = AuthErrorDescription(icon: "lock",
                                                  title: "Login Required",
                                                  description: "Invalid user token.")
    
    static let networkError = AuthErrorDescription(icon: "wifi.slash",
                                              title: "Network Error",
                                              description: "Could not connect to authentication service. Please retry.")
    
    static let userTokenExpired = AuthErrorDescription(icon: "clock.arrow.circlepath",
                                                  title: "Session Expired",
                                                  description: "Your session has expired. Please log in again.")
    
    static let invalidAPIKey = AuthErrorDescription(icon: "key.slash",
                                               title: "Invalid API Key",
                                               description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let userMismatch = AuthErrorDescription(icon: "person.badge.minus",
                                              title: "User Mismatch",
                                              description: "Attempted to reauthenticate with a different user. Please try again with the correct user.")
    
    static let credentialAlreadyInUse = AuthErrorDescription(icon: "link.circle",
                                                        title: "Credential Already Linked",
                                                        description: "The credential is already linked with a different account. Please try a different credential.")
    
    static let weakPassword = AuthErrorDescription(icon: "eyes",
                                              title: "Weak Password",
                                              description: "The password provided is too weak. Please choose a stronger password.")
    
    static let appNotAuthorized = AuthErrorDescription(icon: "xmark.shield",
                                                  title: "App Not Authorized",
                                                  description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let expiredActionCode = AuthErrorDescription(icon: "timer",
                                                   title: "Expired Code",
                                                   description: "The action code has expired. Please request a new one.")
    
    static let invalidActionCode = AuthErrorDescription(icon: "key.slash",
                                                   title: "Invalid Code",
                                                   description: "The action code is invalid. Please check and try again.")
    
    static let invalidMessagePayload = AuthErrorDescription(icon: "envelope.badge",
                                                       title: "Invalid Message Payload",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidSender = AuthErrorDescription(icon: "envelope.badge.person.crop.fill",
                                               title: "Invalid Password Reset Email",
                                               description: "The email is invalid. Please check and try again.")
    
    static let invalidRecipientEmail = AuthErrorDescription(icon: "envelope.badge.person.crop.fill",
                                                       title: "Invalid Recipient Email",
                                                       description: "The recipient email address is invalid. Please check and try again.")
    
    static let missingEmail = AuthErrorDescription(icon: "envelope.arrow.triangle.branch",
                                              title: "Missing Email",
                                              description: "An email address is required but not provided. Please enter an email address.")
    
    static let missingIosBundleID = AuthErrorDescription(icon: "iphone.slash",
                                                    title: "Missing iOS Bundle ID",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingAndroidPackageName = AuthErrorDescription(icon: "flipphone",
                                                           title: "Missing Android Package Name",
                                                           description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let unauthorizedDomain = AuthErrorDescription(icon: "xmark.shield",
                                                    title: "Unauthorized Domain",
                                                    description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidContinueURI = AuthErrorDescription(icon: "link.circle",
                                                    title: "Invalid Continue URL",
                                                    description: "The continue URL provided is not valid. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingContinueURI = AuthErrorDescription(icon: "link.circle",
                                                    title: "Missing Continue URL",
                                                    description: "A continue URL was not provided where required. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingPhoneNumber = AuthErrorDescription(icon: "number",
                                                    title: "Missing Phone Number",
                                                    description: "A phone number is required but was not provided. Please enter a phone number and try again.")
    
    static let invalidPhoneNumber = AuthErrorDescription(icon: "phone",
                                                    title: "Invalid Phone Number",
                                                    description: "The phone number provided is invalid. Please check and try again.")
    
    static let missingVerificationCode = AuthErrorDescription(icon: "lock.slash",
                                                         title: "Missing Verification Code",
                                                         description: "A verification code is required. Please enter the code and try again.")
    
    static let invalidVerificationCode = AuthErrorDescription(icon: "lock.badge.exclamationmark",
                                                         title: "Invalid Verification Code",
                                                         description: "The verification code provided is invalid. Please check and try again.")
    
    static let missingVerificationID = AuthErrorDescription(icon: "person.text.rectangle",
                                                       title: "Missing Verification ID",
                                                       description: "A verification ID is required but not provided. Please enter the ID and try again.")
    
    static let invalidVerificationID = AuthErrorDescription(icon: "person.text.rectangle",
                                                       title: "Invalid Verification ID",
                                                       description: "The verification ID provided is invalid. Please check and try again.")
    
    static let missingAppCredential = AuthErrorDescription(icon: "app.badge",
                                                      title: "Missing App Credential",
                                                      description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidAppCredential = AuthErrorDescription(icon: "app.badge.exclamationmark",
                                                      title: "Invalid App Credential",
                                                      description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let sessionExpired = AuthErrorDescription(icon: "timer",
                                                title: "Code Expired",
                                                description: "The SMS code has expired. Please request a new code and try again.")
    
    static let quotaExceeded = AuthErrorDescription(icon: "exclamationmark.arrow.circlepath",
                                               title: "Quota Exceeded",
                                               description: "The SMS message quota has been exceeded. Please try again later.")
    
    static let missingAppToken = AuthErrorDescription(icon: "app.badge",
                                                 title: "Missing App Token",
                                                 description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let notificationNotForwarded = AuthErrorDescription(icon: "bell.slash",
                                                          title: "Notification Not Forwarded",
                                                          description: "The app failed to forward the remote notification to Authentication. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let appNotVerified = AuthErrorDescription(icon: "shield.lefthalf.fill",
                                                title: "App Not Verified",
                                                description: "Could not verify the app during phone number authentication. Please check your verification setup and try again.")
    
    static let captchaCheckFailed = AuthErrorDescription(icon: "xmark.shield",
                                                    title: "Captcha Check Failed",
                                                    description: "The reCAPTCHA token is invalid. Please try the verification process again.")
    
    static let webContextAlreadyPresented = AuthErrorDescription(icon: "xmark.rectangle",
                                                            title: "Web Context Already Presented",
                                                            description: "A new web context was attempted while one is already presented. Please close the current context and try again.")
    
    static let webContextCancelled = AuthErrorDescription(icon: "xmark.rectangle",
                                                     title: "Web Context Cancelled",
                                                     description: "The URL presentation was cancelled prematurely. Please try again.")
    
    static let appVerificationUserInteractionFailure = AuthErrorDescription(icon: "exclamationmark.triangle",
                                                                       title: "App Verification Failure",
                                                                       description: "Something went wrong while verifying the app. Please try again. If this issue persists, contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidClientID = AuthErrorDescription(icon: "person.badge.exclamationmark",
                                                 title: "Invalid Client ID",
                                                 description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let webNetworkRequestFailed = AuthErrorDescription(icon: "cloud",
                                                         title: "Network Request Failed",
                                                         description: "A network request failed during the web sign-in process. Please check your connection and try again.")
    
    static let webInternalError = AuthErrorDescription(icon: "exclamationmark.triangle",
                                                  title: "Web Internal Error",
                                                  description: "An internal error occurred. Please try again.")
    
    static let webSignInUserInteractionFailure = AuthErrorDescription(icon: "person.badge.exclamationmark",
                                                                 title: "Web Sign-In Failure",
                                                                 description: "A general failure occurred during the web sign-in process. Please try again.")
    
    static let localPlayerNotAuthenticated = AuthErrorDescription(icon: "person.crop.circle.badge.exclamationmark",
                                                             title: "Local Player Not Authenticated",
                                                             description: "Local player was not authenticated before attempting Game Center sign-in. Ensure you are signed into Game Center and try again.")
    
    static let nullUser = AuthErrorDescription(icon: "person.fill.questionmark",
                                          title: "Do you exist?",
                                          description: "The user returned null. This is odd. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let dynamicLinkNotActivated = AuthErrorDescription(icon: "link",
                                                         title: "Could Not Generate Link",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidProviderID = AuthErrorDescription(icon: "person.badge.minus",
                                                   title: "Invalid Provider ID",
                                                   description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let tenantIDMismatch = AuthErrorDescription(icon: "arrow.left.arrow.right",
                                                  title: "Tenant ID Mismatch",
                                                  description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let unsupportedTenantOperation = AuthErrorDescription(icon: "building.columns",
                                                            title: "Unsupported Tenant Operation",
                                                            description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidDynamicLinkDomain = AuthErrorDescription(icon: "link",
                                                          title: "Invalid Domain",
                                                          description: "The domain is not configured or unauthorized for this app. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let rejectedCredential = AuthErrorDescription(icon: "xmark.octagon",
                                                    title: "Rejected Credential",
                                                    description: "The credential provided was rejected due to being misformed or mismatching. Please check the credentials and try again.")
    
    static let gameKitNotLinked = AuthErrorDescription(icon: "gamecontroller.fill",
                                                  title: "GameKit Not Linked",
                                                  description: "GameKit framework is not linked. Ensure it is properly linked and try again.")
    
    static let secondFactorRequired = AuthErrorDescription(icon: "shield.lefthalf.fill",
                                                      title: "Second Factor Required",
                                                      description: "Sign in requires a second factor authentication. Please complete the two-step verification and try again.")
    
    static let missingMultiFactorSession = AuthErrorDescription(icon: "person.crop.circle.badge.exclamationmark",
                                                           title: "Missing Multi-Factor Session",
                                                           description: "The multi-factor session is missing. Please sign in again.")
    
    static let missingMultiFactorInfo = AuthErrorDescription(icon: "person.crop.circle.badge.questionmark",
                                                        title: "Missing Multi Factor Info",
                                                        description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidMultiFactorSession = AuthErrorDescription(icon: "exclamationmark.octagon",
                                                           title: "Invalid Multi Factor Session",
                                                           description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let multiFactorInfoNotFound = AuthErrorDescription(icon: "magnifyingglass",
                                                         title: "Multi Factor Info Not Found",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let adminRestrictedOperation = AuthErrorDescription(icon: "shield.lefthalf.fill",
                                                          title: "Admin Restricted Operation",
                                                          description: "The operation is restricted to admins only. Please check your permissions and try again.")
    
    static let unverifiedEmail = AuthErrorDescription(icon: "envelope.badge",
                                                 title: "Unverified Email",
                                                 description: "The email address has not been verified. Please verify your email address and try again.")
    
    static let secondFactorAlreadyEnrolled = AuthErrorDescription(icon: "shield.lefthalf.fill",
                                                             title: "Second Factor Already Enrolled",
                                                             description: "The second factor is already enrolled. Please use a different method or check your setup.")
    
    static let maximumSecondFactorCountExceeded = AuthErrorDescription(icon: "exclamationmark.triangle",
                                                                  title: "Maximum Second Factor Count Exceeded",
                                                                  description: "The maximum number of second factors has been exceeded. Please remove an existing factor before adding a new one.")
    
    static let unsupportedFirstFactor = AuthErrorDescription(icon: "xmark.shield",
                                                        title: "Unsupported First Factor",
                                                        description: "The first factor is not supported. Please choose a supported authentication method.")
    
    static let emailChangeNeedsVerification = AuthErrorDescription(icon: "envelope.badge",
                                                              title: "Email Change Needs Verification",
                                                              description: "A verified email is required to complete the email change. Please verify the new email address.")
    
    static let missingClientIdentifier = AuthErrorDescription(icon: "exclamationmark.bubble",
                                                         title: "Missing Client Identifier",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingOrInvalidNonce = AuthErrorDescription(icon: "number",
                                                       title: "Missing or Invalid Nonce",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let blockingCloudFunctionError = AuthErrorDescription(icon: "cloud.heavyrain",
                                                            title: "Blocking Cloud Function Error",
                                                            description: "A Cloud Function returned a blocking error. This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let recaptchaNotEnabled = AuthErrorDescription(icon: "exclamationmark.triangle",
                                                     title: "reCAPTCHA Not Enabled",
                                                     description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingRecaptchaToken = AuthErrorDescription(icon: "exclamationmark.bubble",
                                                       title: "Missing reCAPTCHA Token",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidRecaptchaToken = AuthErrorDescription(icon: "xmark.shield",
                                                       title: "Invalid reCAPTCHA Token",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidRecaptchaAction = AuthErrorDescription(icon: "xmark.octagon",
                                                        title: "Invalid reCAPTCHA Action",
                                                        description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingClientType = AuthErrorDescription(icon: "exclamationmark.bubble",
                                                   title: "Missing Client Type",
                                                   description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let missingRecaptchaVersion = AuthErrorDescription(icon: "exclamationmark.bubble",
                                                         title: "Missing reCAPTCHA Version",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidRecaptchaVersion = AuthErrorDescription(icon: "xmark.octagon",
                                                         title: "Invalid reCAPTCHA Version",
                                                         description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let invalidReqType = AuthErrorDescription(icon: "xmark.octagon",
                                                title: "Invalid Request Type",
                                                description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let recaptchaSDKNotLinked = AuthErrorDescription(icon: "link",
                                                       title: "reCAPTCHA SDK Not Linked",
                                                       description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
    
    static let keychainError = AuthErrorDescription(icon: "key",
                                               title: "Keychain Error",
                                               description: "You may need to log in again.")
    
    static let internalError = AuthErrorDescription(icon: "exclamationmark.circle",
                                               title: "Internal Error",
                                               description: "An internal error occurred. Please try again later.")
    
    static let malformedJWT = AuthErrorDescription(icon: "xmark.bin",
                                              title: "Malformed JWT",
                                              description: "This appears to be our problem. Not yours. Please contact us at [app@sstaa.org](mailto:app@sstaa.org).")
}
