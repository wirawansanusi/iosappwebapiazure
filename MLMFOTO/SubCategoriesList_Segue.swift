//
//  SubCategoriesList_Segue.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension SubCategoriesList {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showProducts" {
            
            let destination = segue.destinationViewController as! ProductsList
            destination.navigationItem.title = selectedSubCategory!.title
            destination.categoryId = selectedSubCategory!.id
            destination.latestVersion = selectedSubCategory!.version
            
            isViewDidLoad = true
        }
    }
}