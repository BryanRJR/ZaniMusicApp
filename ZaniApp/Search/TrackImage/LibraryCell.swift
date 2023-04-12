//
//  LibraryCell.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//
import Kingfisher
import SwiftUI

@available(iOS 13.0, *)
struct LibraryCell: View {
    var track: TrackLocal

  var body: some View {
        HStack {
          Image("\(String(describing: track.imageURL))")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(track.trackName)
                    .font(Font.system(size: 17))
                if track.collectionName != nil {
                    Text(track.collectionName ?? "")
                        .font(Font.system(size: 13))
                        .foregroundColor(Color(#colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7294117647, alpha: 1)))
                }
                Text(track.artistName)
                    .font(Font.system(size: 13))
                    .foregroundColor(Color(#colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7294117647, alpha: 1)))
            }
       }
   }
}
