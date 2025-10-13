//
//  Result.swift
//  Ebi360
//
//  Created by Maziar Saadatfar on 2/17/24.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
    case noContent
}

public extension Result {
    var isSuccess: Bool {
        switch self {
        case .success(_):
            return true
        case .noContent:
            return true
        case .failure(_):
            return false
        }
    }
    
    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .noContent:
            return nil
        case .failure(_):
            return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .success(_):
            return nil
        case .noContent:
            return nil
        case .failure(let error):
            return error
        }
    }
}

public extension Result {
    func map<T>(_ transform: (Value) -> T) -> Result<T> {
        switch self {
        case .success(let value):
            let newValue = transform(value)
            return Result<T>.success(newValue)
        case .noContent:
            return Result<T>.noContent
        case .failure(let error):
            return Result<T>.failure(error)
        }
    }
    
    func flatMap<T>(_ transform: (Value) -> Result<T>) -> Result<T> {
        switch self {
        case .success(let value):
            return transform(value)
        case .noContent:
            return Result<T>.noContent
        case .failure(let error):
            return Result<T>.failure(error)
        }
    }
}
