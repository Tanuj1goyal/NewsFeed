//
//  Constants.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation

/*
 1. Contains all the constent from the class ex - Host, domain, API-key etc
 */

struct APIConstants {
    static let apiKey = "XGNuGvj0tRtXB4fUKhGRvsCPOyICOlbG"
}

struct Domain {
    static let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/"
}

struct APIEndpoint {
    static func period(period: Period) -> String {
        return "all-sections/\(period.rawValue).json?api-key=\(APIConstants.apiKey)"
    }
}

enum Period: String {
    case one = "1"
    case seven = "7"
    case thirty = "30"
}

enum HTTPHeaderField: String {
    case authentication  = "Authorization"
    case contentType     = "Content-Type"
    case acceptType      = "Accept"
    case acceptEncoding  = "Accept-Encoding"
    case acceptLangauge  = "Accept-Language"
}

enum ContentType: String {
    case json            = "application/json"
    case multipart       = "multipart/form-data"
    case ENUS            = "en-us"
}
