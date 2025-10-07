//
//  ActionRequest.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
public let controlKit_DeviceUUIDKey = "deviceUUID"
public struct ActionRequest: GenericRequest {
    public var route: ControlKitItem
    public var appId: String
    public var sdkVersion: String
    public var action: ControlKitAction
    public var itemId: String?
    public var extraParameter: String?
    
    public var httpMethod: HTTPMethod = .post
    public var applicationVersion: String = Bundle.main.bundleIdentifier ?? String()
    public var deviceUUID: String {
        return CKDeviceUUID
    }
    
    public var headers: [String : String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": self.deviceUUID]
    }
    
    public var body: [String: String] {
        return ["action": action.rawValue]
    }
    
    public init(
        route: ControlKitItem,
        appId: String,
        sdkVersion: String,
        action: ControlKitAction,
        itemId: String? = nil,
        extraParameter: String? = nil,
        httpMethod: HTTPMethod = .post
    ) {
        self.route = route
        self.appId = appId
        self.sdkVersion = sdkVersion
        self.action = action
        self.itemId = itemId
        self.extraParameter = extraParameter
        self.httpMethod = httpMethod
    }
}

public enum ControlKitAction: String {
    case view = "VIEW"
    case update = "UPDATE"
    case submit = "SUBMIT"
    case cancel = "CANCEL"
    case accept = "ACCEPT"
    case decline = "DECLINE"
    case accepted = "ACCEPTED"
    case canceled = "CANCELED"
}
