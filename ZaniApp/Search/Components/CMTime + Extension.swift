//
//  CMTime + Extension.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import AVKit
import Foundation

extension CMTime {
    var displayableString: String {
        if CMTimeGetSeconds(self).isNaN { return "" }
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = totalSeconds / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
}
