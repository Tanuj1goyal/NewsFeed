//
//  Networking.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation

typealias Handler = (Result<Data>) -> Void

enum Result<Value: Decodable> {
    case success(Value)
    case failure(String)
}

public enum Method {
    case delete
    case get
    case head
    case post
    case put
    case connect
    case options
    case trace
    case patch
    case other(method: String)
}

extension Method {
    public init(_ rawValue: String) {
        let method = rawValue.uppercased()
        switch method {
        case "DELETE":
            self = .delete
        case "GET":
            self = .get
        case "HEAD":
            self = .head
        case "POST":
            self = .post
        case "PUT":
            self = .put
        case "CONNECT":
            self = .connect
        case "OPTIONS":
            self = .options
        case "TRACE":
            self = .trace
        case "PATCH":
            self = .patch
        default:
            self = .other(method: method)
        }
    }
}

extension Method: CustomStringConvertible {
    public var description: String {
        switch self {
        case .delete:            return "DELETE"
        case .get:               return "GET"
        case .head:              return "HEAD"
        case .post:              return "POST"
        case .put:               return "PUT"
        case .connect:           return "CONNECT"
        case .options:           return "OPTIONS"
        case .trace:             return "TRACE"
        case .patch:             return "PATCH"
        case .other(let method): return method.uppercased()
        }
    }
}

// MARK:- API data Requestable
protocol Requestable {}

extension Requestable {

    internal func request(method: Method, url: String, params: [NSString: Any]? = nil, callback: @escaping Handler) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        request.setValue(ContentType.ENUS.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptLangauge.rawValue)
        if let params = params {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
        }
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    callback(.failure(error.localizedDescription))
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        guard let responseData = data else {
                            callback(.failure("Error - \(httpResponse.statusCode)"))
                            return
                        }
                        callback(.success(responseData))
                    } else {
                        callback(.failure("Error - \(httpResponse.statusCode)"))
                    }
                }
            }
        })
        task.resume()
    }
}
