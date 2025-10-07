//
//  ErrorModel.swift
//  Ebi360
//
//  Created by Maziar Saadatfar on 2/18/24.
//

import Foundation

public struct ErrorModel: Codable {
    public var message: String?
    public var success: Bool?
    public var statusCode: Int?
    public var data: [ErrorField]?
}

public struct ErrorField: Codable {
    public var message: String?
    public var field: String?
}
