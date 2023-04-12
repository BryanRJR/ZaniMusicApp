//
//  TrackCell.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import Kingfisher
import UIKit

protocol TrackCellViewModel {
    var iconURL: String? { get }
    var trackName: String { get }
    var artistName: String { get }
    var collectionName: String? { get }
}

protocol TrackCellDelegate: AnyObject {
    func trackCell(_ cell: TrackCell, shouldSave track: SearchViewModel.Cell)
}

class TrackCell: UITableViewCell {
    static let cellId = "TrackCell"

    weak var delegate: TrackCellDelegate?

    @IBOutlet private var trackImageView: UIImageView!
    //@IBOutlet private var trackNameLabel: UILabel!
    @IBOutlet private var artistNameLabel: UILabel!
    @IBOutlet private var collectionNameLabel: UILabel!

    var trackModel: SearchViewModel.Cell? {
        didSet {
            trackImageView.kf.indicatorType = .activity
           // trackNameLabel.text = trackModel?.trackName
            artistNameLabel.text = trackModel?.artistName
            collectionNameLabel.text = trackModel?.collectionName
          trackImageView.kf.setImage(with: URL(string: trackModel?.iconURL ?? ""))
//            let isFavorite = !CoreDataManager.shared.search(for: trackModel?.trackId ?? 0).isEmpty
//            addTrackButton.isHidden = isFavorite
        }
    }

}

