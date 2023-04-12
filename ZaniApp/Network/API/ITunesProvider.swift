//
//  ITunesProvider.swift
//  ZaniApp
//
//  Created by MacBook Pro on 10/04/23.
//

import Foundation

enum ITunesProvider: Provider {
    case tracks(query: String)

    var baseUrl: URL {
        URL(string: "https://itunes.apple.com/search")!
    }

    var params: [NetworkParam] {
        switch self {
        case .tracks(let query):
            return [NetworkParam(name: "term", value: query), NetworkParam(name: "media", value: "music")]
        }
    }
}

protocol Provider {
    var baseUrl: URL { get }
    var params: [NetworkParam] { get }
}

enum NetworkErrorType: Error {
    case decoding
    case urlEncoding
}

struct NetworkParam {
    let name: String
    let value: String
}

protocol NetworkClientType {
    func execute<Request: Provider, T: Decodable>(request: Request, with type: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void)
}
