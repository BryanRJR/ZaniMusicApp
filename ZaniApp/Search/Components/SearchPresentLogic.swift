//
//  SearchPresentLogic.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import UIKit

protocol SearchPresentationLogic {
    func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?

    func presentData(response: Search.Model.Response.ResponseType) {
        switch response {
        case let .presentTracks(searchResult):
            let cells = searchResult.results.map { (track) -> SearchViewModel.Cell in
                return self.createCellViewModel(from: track)
            }
            let searchViewModel = SearchViewModel(cells: cells)
            viewController?.displayData(viewModel: .displayTracks(searchViewModel))

        case .presentFooterView:
            viewController?.displayData(viewModel: .displayFooterView)

        case let .presentError(error):
            viewController?.displayData(viewModel: .displayError(error))
        }
    }


    private func createCellViewModel(from track: Tracks) -> SearchViewModel.Cell {
      return SearchViewModel.Cell(trackId: track.track_Id,
                                  iconURL: track.artworkUrl100,
                                    trackName: track.trackName,
                                    collectionName: track.collectionName,
                                    artistName: track.artistName,
                                    previewUrl: track.previewUrl)
    }
}
