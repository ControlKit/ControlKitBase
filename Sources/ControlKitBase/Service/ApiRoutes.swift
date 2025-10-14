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
    case launchAlert = "api/launch-alerts"
    case inboxView = "api/inboxes"
    case voteView = "api/votes"
    case netPromoterScore = "api/net-promoter-scores"
    case contactSupport = "api/contacts"
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
