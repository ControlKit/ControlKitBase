//
//  ActionResponse.swift
//  InboxKit
//
//  Created by Maziar Saadatfar on 9/1/25.
//
import Foundation
public struct ActionResponse: Codable {
    public var data: ActionModel?
}
public struct ActionModel: Codable {
    public let id: String
}


public typealias LocalString = [LocalizedText]
public struct LocalizedText: Codable {
    public let language: String?
    public let content: String?
    public init(language: String?, content: String?) {
        self.language = language
        self.content = content
    }
}
