//
//  ProductsList_FetchVersion.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/17/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

extension ProductsList {
    
    func checkVersion() {
        
        let predicate = NSPredicate(format: "categoryId = \(categoryId)")
        let productsData = CDProducts.MR_findAllSortedBy("title", ascending: true, withPredicate: predicate) as! [CDProducts]
        
        
        // First we need to check the latest version
        // If it's already updated with the latest version,
        // We want to show the Core Data
        if productsData.count > 0 {
            
            // We have to compare if the current product needs to update its own data
            // since it has an outdated version
            let currentVersion_number = productsData.first!.version!
            let currentVersion = Int(currentVersion_number)
            print("current version: \(currentVersion) againts latest version: \(self.latestVersion)")
            if currentVersion >= self.latestVersion {
                print("no update needed")
                initProductsCoreData(productsData)
            
            } else {
                
                print("update needed")
                // Else, we want to update it into the latest version
                // by fetching the JSON data
                // And replacing the newest data by deleting the current ones
                // And addding the newest data from the beginning
                initJSONData()
            }
            
            // Else, we want to update it into the latest version
            // by fetching the JSON data
            // And replacing the newest data by deleting the current ones
            // And addding the newest data from the beginning
        } else {
            
            initJSONData()
        }


    }
}
