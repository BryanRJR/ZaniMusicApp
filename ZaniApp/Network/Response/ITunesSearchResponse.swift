//
//  ITunesSearchResponse.swift
//  ZaniApp
//
//  Created by MacBook Pro on 10/04/23.
//

import Foundation

struct ITunesSearchResponse: Codable {
    let resultCount: Int
    let results: [ITunesTrack]
}
