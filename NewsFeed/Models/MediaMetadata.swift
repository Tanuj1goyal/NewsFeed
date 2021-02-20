//
//  MediaMetadata.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation

/*
 1. Creating MediaMetadata Data structure to store all the JSON
 */

struct MediaMetadata: Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
}
