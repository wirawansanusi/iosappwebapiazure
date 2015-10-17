//
//  CDCategories+CoreDataProperties.swift
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

extension CDCategories {

    @NSManaged var id: NSNumber?
    @NSManaged var title: String?
    @NSManaged var parent: NSNumber?
    @NSManaged var version: NSNumber?
    @NSManaged var subCategories: NSOrderedSet?

}
