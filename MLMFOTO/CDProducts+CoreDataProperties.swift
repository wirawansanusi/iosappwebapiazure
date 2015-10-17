//
//  CDProducts+CoreDataProperties.swift
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

extension CDProducts {

    @NSManaged var id: NSNumber?
    @NSManaged var title: String?
    @NSManaged var body: String?
    @NSManaged var categoryId: NSNumber?
    @NSManaged var hasFavorited: NSNumber?
    @NSManaged var version: NSNumber?
    @NSManaged var thumbnails: NSOrderedSet?

}
