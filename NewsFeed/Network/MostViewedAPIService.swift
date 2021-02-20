//
//  MostViewedAPIService.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation
import UIKit

struct MostViewedAPIService: Requestable {
    static let instance = MostViewedAPIService()
    
    // Call to Networking layer
    func fetchMostViewedFeeds(callback: @escaping Handler) {
        let requestURL = Domain.baseUrl + APIEndpoint.period(period: .seven)
        request(method: .get, url: requestURL) { (result) in
            callback(result)
        }
    }
}
