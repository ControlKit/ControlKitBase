//
//  ApiRoutes.swift
//  Ebi360
//
//  Created by Maziar Saadatfar on 2/18/24.
//

import Foundation
enum ApiRoutes: String {
    case baseUrl = "https://tauri.ir/"
    case forceUpdate = "api/force-updates"
    case launchAlert = "api/launch-alert"
    case inboxView = "api/inbox-view"
    case voteView = "api/vote-view"
    case netPromoterScore = "api/nps"
    case contactSupport = "api/contact-support"
    case agreement = "api/terms-and-conditions"
    
    var fullUrl: String {
        return ApiRoutes.baseUrl.rawValue + self.rawValue
    }
}

public enum ControlKitItem {
    case force_update
    case launch_alert
    case vote
    case agreement
    case contact_support
    case nps
    case inbox
}
