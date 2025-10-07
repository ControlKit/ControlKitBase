import Foundation

class GenericService: BaseService,
                      GenericServiceProtocol {
    func execute<T: GenericRequest, M: Codable>(request: T) async throws -> Result<M> {
        guard let url = URL(string: request.route) else {
            print("Invalid URL")
            let errorModel = NSError(domain: "Invalid URL", code: 11)
            let result = Result<M>.failure(errorModel)
            return result
        }
        var req = URLRequest(url: url)
        req.httpMethod = request.httpMethod.rawValue
        req.allHTTPHeaderFields = request.header
        req.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        do {
            if !request.body.isEmpty {
                req.httpBody = try JSONSerialization.data(withJSONObject: request.body)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        let (data, response) = try await URLSession.shared.data(for: req)
        if (response as? HTTPURLResponse)?.statusCode ?? 0 >= 200 ||
            (response as? HTTPURLResponse)?.statusCode ?? 0 < 300 {
            let result: Result<M> = BaseSerializer.shared.serialize(data: data)
            return result
        } else {
            print("Invalid Response")
            let errorModel = NSError(domain: "Invalid Response",
                                     code: (response as? HTTPURLResponse)?.statusCode ?? 12)
            let result = Result<M>.failure(errorModel)
            return result
        }
    }
}
