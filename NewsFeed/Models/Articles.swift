//
//  Feeds.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation

/*
 1. Creating Article Data structure to store all the JSON
 */

struct Articles : Codable {
    let results : [Results]?

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
