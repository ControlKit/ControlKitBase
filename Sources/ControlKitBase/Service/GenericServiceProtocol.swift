//
//  GenericServiceProtocol.swift
//  Ebi360
//
//  Created by Maziar Saadatfar on 2/17/24.
//

import Foundation

public protocol GenericServiceProtocol {
    func execute<T: GenericRequest, M: Codable>(request: T) async throws-> Result<M>
}
