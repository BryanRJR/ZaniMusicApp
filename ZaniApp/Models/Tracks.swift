//
//  Tracks.swift
//  ZaniApp
//
//  Created by MacBook Pro on 11/04/23.
//

import Foundation

struct TracksResponse: Decodable {
  let resultCount: Int16
  let results: [Tracks]
}

  struct Tracks: Decodable {
    let track_Id: Int
    let artistName: String
    let collectionName: String?
    let trackName: String
    let artworkUrl100: String?
    let previewUrl: String?


    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case artistName
        case trackName
        case collectionName
        case artworkUrl100
        case previewUrl

    }

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      track_Id = try container.decode(Int.self, forKey: .id)

      artistName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? ""
      collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName) ?? ""
      trackName = try container.decodeIfPresent(String.self, forKey: .trackName) ?? ""
      artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? ""
      previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl) ?? ""

    }

    
  }

