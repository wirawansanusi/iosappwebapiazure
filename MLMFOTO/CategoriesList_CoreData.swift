//
//  CategoriesList_CoreData.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/13/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

extension CategoriesList {
    
    func initCoreData() {
        
        categories = [Categories]()
        let categoriesData = CDCategories.MR_findAllSortedBy("title", ascending: true)
        for categoryData in categoriesData as! [CDCategories] {
            
            if let parent = categoryData.parent {
                let isParent = Bool(parent)
                if isParent  {
                    let id_number = categoryData.id!
                    let id = Int(id_number)
                    let title = categoryData.title!
                    let version_number = categoryData.version!
                    let version = Int(version_number)
                    let category = Categories(id: id, title: title, version: version)
            
                    var subCategories = [SubCategories]()
                    if let subCategoriesData = categoryData.subCategories {
                        for subCategoryDataSet in subCategoriesData {
                    
                            let subCategoryData = subCategoryDataSet as! CDCategories
                            let id_number = subCategoryData.id!
                            let id = Int(id_number)
                            let child_title = subCategoryData.title!
                            let version_number = subCategoryData.version!
                            let version = Int(version_number)
                            let subCategory = SubCategories(id: id, title: child_title, parent_title: title, version: version)
                    
                            subCategories.append(subCategory)
                        }
                    category.subCategories = subCategories
                    categories.append(category)
                    }
                }
            }
        }
            
        reinitTableView()
    }
    
    func checkDataFromCoreData() {
        
        deleteAllFromCoreData()
    }
    
    // Delete all data inside the Categories entity
    func deleteAllFromCoreData() {
        
        let categoriesData = CDCategories.MR_findAll() as! [CDCategories]
        let totalData = categoriesData.count
        for index in 0..<totalData {
            
            MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
                
                categoriesData[index].MR_deleteEntityInContext(localContext)
                
                }, completion: { (success: Bool, error: NSError!) -> Void in
                    
                    if index + 1 == totalData {
                        
                        // All data has been deleted
                        // Proceed into saving new data
                        self.saveIntoCoreData()
                    }
            })
        }
        
        // There's no previous data inside the core data
        if totalData == 0 {
            
            self.saveIntoCoreData()
        }
    }
    
    func saveIntoCoreData() {
        
        for category in categories {
            MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
            
                let categoryData = CDCategories.MR_createEntityInContext(localContext)
                categoryData.id = category.id
                categoryData.title = category.title
                categoryData.version = category.version
                categoryData.parent = true

                // Check if there's any SubCategories inside the Category
                if category.subCategories?.count > 0 {
                    let subCategoriesData = NSMutableOrderedSet()
                    
                    for subCategory in category.subCategories! {
                        let subCategoryData = CDCategories.MR_createEntityInContext(localContext)
                        subCategoryData.id = subCategory.id
                        subCategoryData.title = subCategory.title
                        subCategoryData.version = subCategory.version
                        subCategoryData.parent = false
                        
                        subCategoriesData.addObject(subCategoryData)
                    }
                    
                    categoryData.subCategories = subCategoriesData
                }
            
                }) { (success: Bool, error: NSError!) -> Void in
                    
            }
        }
    }
    
    // We used this function to check if the product data
    // was already updated
    func checkUpdateVersion() {
        
        for category in categories {
            
            let id = category.id
            MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
                
                let categoryData = CDCategories.MR_findFirstByAttribute("id", withValue: id)
                let latestVersion_number = categoryData.version
                let latestVersion = Int(latestVersion_number!)
                category.version = latestVersion
                
                }, completion: { (success: Bool, error: NSError!) -> Void in
                    
            })
        }
        
        tableView.reloadData()
    }
}
