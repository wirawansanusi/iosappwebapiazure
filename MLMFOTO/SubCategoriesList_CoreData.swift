//
//  SubCategoriesList_CoreData.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/14/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

extension SubCategoriesList {
    
    // We used this function to check if the product data
    // was already updated
    func checkUpdateVersion() {
        
        for subCategory in subCategories {
            
            let id = subCategory.id
            MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
                
                let subCategoryData = CDCategories.MR_findFirstByAttribute("id", withValue: id)
                let hasUpdated = subCategoryData.hasUpdated!.boolValue
                subCategory.hasUpdated = hasUpdated
                
                }, completion: { (success: Bool, error: NSError!) -> Void in
            })
        }
        
        tableView.reloadData()
    }
}
