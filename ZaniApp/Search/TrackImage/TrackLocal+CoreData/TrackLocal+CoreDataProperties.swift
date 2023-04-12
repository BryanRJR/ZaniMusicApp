//
//  TrackLocal+CoreDataProperties.swift
//  ZaniApp
//
//  Created by MacBook Pro on 12/04/23.
//

import Foundation
import CoreData


extension TrackLocal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TrackLocal> {
        return NSFetchRequest<TrackLocal>(entityName: "TrackLocal")
    }

    @NSManaged public var trackId: Int
    @NSManaged public var trackName: String
    @NSManaged public var artistName: String
    @NSManaged public var imageURL: String?
    @NSManaged public var savingDate: Date
    @NSManaged public var collectionName: String?
    @NSManaged public var previewURL: String?

}
