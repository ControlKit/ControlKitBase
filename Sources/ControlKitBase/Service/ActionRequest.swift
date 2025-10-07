//
//  ActionRequest.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
public struct ActionRequest {
    public var appId: String = Bundle.main.bundleIdentifier ?? String()
    public var route: String
    public var deviceUUID: String = UUID().uuidString
    public var sdkVersion: String = "1.0.0"
    
    var dictionary: [String: String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": "1",
                "x-device-uuid": deviceUUID]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
