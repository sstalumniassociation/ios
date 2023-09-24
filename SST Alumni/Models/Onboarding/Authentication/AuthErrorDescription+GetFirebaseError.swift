//
//  AuthErrorDescription+GetFirebaseError.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 24/9/23.
//

import Foundation

extension AuthErrorDescription {
    static var allFirebaseErrors: [Int: AuthErrorDescription] {
        [
            17000: Self.invalidCustomToken,
            17002: Self.customTokenMismatch,
            17004: Self.invalidCredential,
            17005: Self.userDisabled,
            17006: Self.operationNotAllowed,
            17007: Self.emailAlreadyInUse,
            17008: Self.invalidEmail,
            17009: Self.wrongPassword,
            17010: Self.tooManyRequests,
            17011: Self.userNotFound,
            17012: Self.accountExistsWithDifferentCredential,
            17014: Self.requiresRecentLogin,
            17015: Self.providerAlreadyLinked,
            17016: Self.noSuchProvider,
            17017: Self.invalidUserToken,
            17020: Self.networkError,
            17021: Self.userTokenExpired,
            17023: Self.invalidAPIKey,
            17024: Self.userMismatch,
            17025: Self.credentialAlreadyInUse,
            17026: Self.weakPassword,
            17028: Self.appNotAuthorized,
            17029: Self.expiredActionCode,
            17030: Self.invalidActionCode,
            17031: Self.invalidMessagePayload,
            17032: Self.invalidSender,
            17033: Self.invalidRecipientEmail,
            17034: Self.missingEmail,
            17036: Self.missingIosBundleID,
            17037: Self.missingAndroidPackageName,
            17038: Self.unauthorizedDomain,
            17039: Self.invalidContinueURI,
            17040: Self.missingContinueURI,
            17041: Self.missingPhoneNumber,
            17042: Self.invalidPhoneNumber,
            17043: Self.missingVerificationCode,
            17044: Self.invalidVerificationCode,
            17045: Self.missingVerificationID,
            17046: Self.invalidVerificationID,
            17047: Self.missingAppCredential,
            17048: Self.invalidAppCredential,
            17051: Self.sessionExpired,
            17052: Self.quotaExceeded,
            17053: Self.missingAppToken,
            17054: Self.notificationNotForwarded,
            17055: Self.appNotVerified,
            17056: Self.captchaCheckFailed,
            17057: Self.webContextAlreadyPresented,
            17058: Self.webContextCancelled,
            17059: Self.appVerificationUserInteractionFailure,
            17060: Self.invalidClientID,
            17061: Self.webNetworkRequestFailed,
            17062: Self.webInternalError,
            17063: Self.webSignInUserInteractionFailure,
            17066: Self.localPlayerNotAuthenticated,
            17067: Self.nullUser,
            17068: Self.dynamicLinkNotActivated,
            17071: Self.invalidProviderID,
            17072: Self.tenantIDMismatch,
            17073: Self.unsupportedTenantOperation,
            17074: Self.invalidDynamicLinkDomain,
            17075: Self.rejectedCredential,
            17076: Self.gameKitNotLinked,
            17078: Self.secondFactorRequired,
            17081: Self.missingMultiFactorSession,
            17082: Self.missingMultiFactorInfo,
            17083: Self.invalidMultiFactorSession,
            17084: Self.multiFactorInfoNotFound,
            17085: Self.adminRestrictedOperation,
            17086: Self.unverifiedEmail,
            17087: Self.secondFactorAlreadyEnrolled,
            17088: Self.maximumSecondFactorCountExceeded,
            17089: Self.unsupportedFirstFactor,
            17090: Self.emailChangeNeedsVerification,
            17093: Self.missingClientIdentifier,
            17094: Self.missingOrInvalidNonce,
            17105: Self.blockingCloudFunctionError,
            17200: Self.recaptchaNotEnabled,
            17201: Self.missingRecaptchaToken,
            17202: Self.invalidRecaptchaToken,
            17203: Self.invalidRecaptchaAction,
            17204: Self.missingClientType,
            17205: Self.missingRecaptchaVersion,
            17206: Self.invalidRecaptchaVersion,
            17207: Self.invalidReqType,
            17208: Self.recaptchaSDKNotLinked,
            17995: Self.keychainError,
            17999: Self.internalError,
            18000: Self.malformedJWT
        ]
    }
    
    static func fromFirebase(_ errorCode: Int) -> AuthErrorDescription? {
        allFirebaseErrors[errorCode]
    }
}
