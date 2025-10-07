import Foundation

enum BaseViewModelChange<T: Codable> {
    case didSuccess
    case didError(Error)
    case didChangeNetworkActivityStatus(Bool)
}
