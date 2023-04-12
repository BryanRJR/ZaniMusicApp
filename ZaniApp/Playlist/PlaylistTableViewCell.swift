//
//  PlaylistTableViewCell.swift
//  ZaniApp
//
//  Created by MacBook Pro on 08/04/23.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
  @IBOutlet weak var playlistName: UILabel!
  @IBOutlet weak var playlistImage: UIImageView!
  
  @IBOutlet weak var playlistSongs: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
