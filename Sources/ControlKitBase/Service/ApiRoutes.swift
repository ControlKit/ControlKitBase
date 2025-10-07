//
//  ApiRoutes.swift
//  Ebi360
//
//  Created by Maziar Saadatfar on 2/18/24.
//

import Foundation
enum ApiRoutes: String {
    case baseUrl = "https://tauri.ir/"
    case forceUpdate = "api/force-update"
    case launchAlert = "api/launch-alert"
    case inboxView = "api/inbox-view"
    case voteView = "api/vote-view"
    case netPromoterScore = "api/net-promoter-score"
    case contactSupport = "api/contact-support"
    case termsAndConditions = "api/terms-and-conditions"
    
    var fullUrl: String {
        return ApiRoutes.baseUrl.rawValue + self.rawValue
    }
}
