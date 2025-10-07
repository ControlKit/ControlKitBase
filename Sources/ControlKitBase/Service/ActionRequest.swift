//
//  ActionRequest.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
let controlKit_DeviceUUIDKey = "deviceUUID"
public struct ActionRequest: GenericRequest {
    public var httpMethod: HTTPMethod
    public var body: [String : String]
    public var route: ControlKitItem
    public var itemId: String?
    public var extraParameter: String?
    public var appId: String
    public var sdkVersion: String
    public var action: ControlKitAction
    
    public var applicationVersion: String = Bundle.main.bundleIdentifier ?? String()
    public var deviceUUID: String {
        if let deviceID = UserDefaults.standard.string(forKey: controlKit_DeviceUUIDKey) {
            return deviceID
        } else {
            let uuid = UUID().uuidString
            UserDefaults.standard.set(uuid, forKey: controlKit_DeviceUUIDKey)
            return uuid
        }
    }
    
    public var headers: [String : String] {
        return ["x-app-id": appId,
                "x-sdk-version": sdkVersion,
                "x-version": applicationVersion,
                "x-device-uuid": self.deviceUUID]
    }
    
    var params: [String: String] {
        return ["action": action.rawValue]
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
