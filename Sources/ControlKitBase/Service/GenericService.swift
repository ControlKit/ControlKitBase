import Foundation

public class GenericService: BaseService,
                      GenericServiceProtocol {
    public override init() {
    }
    public func execute<T: GenericRequest, M: Codable>(request: T) async throws -> Result<M> {
        var route = getServiceRoute(type: request.route)
        if let extraParameter = request.extraParameter {
            route = route + "/\(extraParameter)"
        }
        guard var urlComponents = URLComponents(string: route) else {
            print("Invalid URL")
            let errorModel = NSError(domain: "Invalid URL", code: 11)
            let result = Result<M>.failure(errorModel)
            return result
        }
        if request.httpMethod == .get {
            var queryItems = urlComponents.queryItems ?? []
            for requestItem in request.body {
                queryItems.append(URLQueryItem(name: "\(requestItem.key)", value: "\(requestItem.value)"))
            }
            if queryItems.count > 0 {
                urlComponents.queryItems = queryItems
            }
        }
        guard let url = urlComponents.url else {
            print("Invalid URL")
            let errorModel = NSError(domain: "Invalid URL", code: 11)
            let result = Result<M>.failure(errorModel)
            return result
        }
        var req = URLRequest(url: url)
        req.httpMethod = request.httpMethod.rawValue
        req.allHTTPHeaderFields = request.headers
        req.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        if request.httpMethod == .post{
            req.httpBody = try JSONEncoder().encode(request.body)
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
    
    private func getServiceRoute(type: ControlKitItem) -> String {
        switch type {
        case .agreement:
            return ApiRoutes.baseUrl.rawValue + ApiRoutes.agreement.rawValue
        case .inbox:
            return ApiRoutes.baseUrl.rawValue + ApiRoutes.inboxView.rawValue
        case .force_update:
            return ApiRoutes.baseUrl.rawValue + ApiRoutes.forceUpdate.rawValue
        case .launch_alert:
            return ApiRoutes.baseUrl.rawValue + ApiRoutes.launchAlert.rawValue
        case .nps:
            return ApiRoutes.baseUrl.rawValue + ApiRoutes.netPromoterScore.rawValue
        case .vote:
            return ApiRoutes.baseUrl.rawValue + ApiRoutes.voteView.rawValue
        case .contact_support:
            return ApiRoutes.baseUrl.rawValue + ApiRoutes.contactSupport.rawValue
        }
    }
}


