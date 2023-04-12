//
//  SearchModels.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import Combine
import UIKit

enum Search {
  enum Model {
    struct Request {
      enum RequestType {
        case getTracks(name: String)
      }
    }
    struct Response {
      enum ResponseType {
        case presentTracks(_ response: TracksResponse)
        case presentFooterView
        case presentError(_ error: Error)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayTracks(_ searchViewModel: SearchViewModel)
        case displayFooterView
        case displayError(_ error: Error)
      }
    }
  }
}

struct SearchViewModel {
    struct Cell: TrackCellViewModel {
        let trackId: Int
        let iconURL: String?
        let trackName: String
        let collectionName: String?
        let artistName: String
        let previewUrl: String?
    }

    let cells: [Cell]
}
