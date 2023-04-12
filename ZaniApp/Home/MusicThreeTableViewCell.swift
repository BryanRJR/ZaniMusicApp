//
//  MusicThreeTableViewCell.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import UIKit



class MusicThreeTableViewCell: UITableViewCell {
  @IBOutlet weak var imageSongView: UIImageView!

  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!


  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    setup()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func setup() {
    imageSongView.layer.cornerRadius = 3
    imageSongView.layer.masksToBounds = true
  }
}

