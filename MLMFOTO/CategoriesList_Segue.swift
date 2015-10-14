//
//  CategoriesList_Segue.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showSubCategories" {
            
            let destination = segue.destinationViewController as! SubCategoriesList
            destination.navigationItem.title = selectedSubCategory!.first!.parent_title
            destination.subCategories = selectedSubCategory
            
        } else if segue.identifier == "showProducts" {
            
            let destination = segue.destinationViewController as! ProductsList
            destination.navigationItem.title = selectedCategory!.title
            destination.categoryId = selectedCategory!.id
            destination.hasUpdated = selectedCategory!.hasUpdated
        }
    }
}