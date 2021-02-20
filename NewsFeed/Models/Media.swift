//
//  Media.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation

/*
 1. Creating Media Data structure to store all the JSON
 2. Media also store MediaMetadata information
 */

struct Media : Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approved_for_syndication : Int?
    let mediaMetadata : [MediaMetadata]?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}
