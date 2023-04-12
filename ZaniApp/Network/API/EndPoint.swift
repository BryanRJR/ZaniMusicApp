//
//  EndPoint.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import Foundation

enum EndPoint {
    case searchTrack(name: String)

    var scheme: String {
        return "https"
    }

    var host: String {
        return "itunes.apple.com"
    }

    var path: String {
        switch self {
        case .searchTrack:
            return "/search"
        }
    }

    var params: [String: String] {
        switch self {
        case let .searchTrack(name):
            return [
                "term": name,
                "media": "music"
            ]
        }
    }

    var headers: [String: String] {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
}
