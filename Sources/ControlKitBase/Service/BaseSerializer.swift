import Foundation

class BaseSerializer {
    static let shared = BaseSerializer()
    func serialize<T: Codable>(data: Data) -> Result<T> {
        let response = try? JSONDecoder().decode(T.self, from: data)
        guard let response = response else {
            let errorModel = NSError(domain: "invalid response",
                                     code: 12,
                                     userInfo: nil)
            let result = Result<T>.failure(errorModel)
            return result
        }
        return Result<T>.success(response)
    }
}
