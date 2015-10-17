//
//  CDThumbnails+CoreDataProperties.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/17/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CDThumbnails {

    @NSManaged var id: NSNumber?
    @NSManaged var imageView: NSObject?
    @NSManaged var imageData: NSData?
    @NSManaged var largeImageData: NSData?
    @NSManaged var product: CDProducts?

}
