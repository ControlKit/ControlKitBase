//
//  ServiceConfigProtocol.swift
//  ControlKitBase
//
//  Created by Maziar Saadatfar on 12/3/25.
//
public protocol ServiceConfigProtocol {
    var name: String { get set }
    var appId: String { get set }
    var language: CKLanguage { get set }
    var sdkVersion: String { get set }
    var viewConfig: ViewConfigProtocol { get set }
}

public struct ViewConfigProtocol {
    
}

