//
//  ITunesTrack.swift
//  ZaniApp
//
//  Created by MacBook Pro on 10/04/23.
//

import Foundation

struct ITunesTrack {
    let artistName: String
    let trackName: String
    let artworkUrl: URL
}

// MARK: - Decodable
extension ITunesTrack: Codable {
    private enum CodingKeys: String, CodingKey {
        case artistName, trackName
        case artworkUrl = "artworkUrl100"
    }
}
