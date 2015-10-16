//
//  ProductsList_ProductsCoreData.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/14/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

extension ProductsList {
    
    func initProductsCoreData() {
        
        let predicate = NSPredicate(format: "categoryId = \(categoryId)")
        let productsData = CDProducts.MR_findAllSortedBy("title", ascending: true, withPredicate: predicate) as! [CDProducts]
        
        products = [Products]()
        for productData in productsData {
            
            let id_number = productData.id!
            let id = Int(id_number)
            let title = productData.title!
            let body = productData.body!
            
            var thumbnailsId = [Int]()
            var thumbnails = [UIImageView]()
            if let thumbnailsData = productData.thumbnails {
                for thumbnailDataSet in thumbnailsData {
                    
                    let thumbnailData = thumbnailDataSet as! CDThumbnails
                    let thumbnailId_number = thumbnailData.id!
                    let thumbnailId = Int(thumbnailId_number)
                    let thumbnailImageView = thumbnailData.imageView as! UIImageView
                    
                    thumbnailsId.append(thumbnailId)
                    thumbnails.append(thumbnailImageView)
                }
            }
            
            let product = Products(id: id, title: title, body: body, thumbnailsId: thumbnailsId)
            product.hasFavorited = productData.hasFavorited?.boolValue
            product.thumbnails = thumbnails
            
            products.append(product)
        }
        
        if productsData.count > 0 {
            reinitTableView()
        } else {
            initJSONData()
        }
        
    }
    
    func fetchingNewProductsVersion() {
    
        deleteProductsFromCoreData()
    }
    
    func deleteProductsFromCoreData() {
        
        // Find all product and deletes it
        let predicate = NSPredicate(format: "categoryId = \(categoryId)")
        let productsData = CDProducts.MR_findAllWithPredicate(predicate) as! [CDProducts]
        let totalProduct = productsData.count
        for index in 0..<totalProduct {
            
            MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
                
                productsData[index].MR_deleteEntityInContext(localContext)
                
                }, completion: { (success: Bool, error: NSError!) -> Void in
                    
                    if index + 1 == totalProduct {
                        
                        self.saveProductsIntoCoreData()
                        self.setCategoryUpdate()
                    }
            })
        }
        
        // If there's no previous product stored in Core Data
        if totalProduct == 0 {
            
            saveProductsIntoCoreData()
            setCategoryUpdate()
        }
    }
    
    func saveProductsIntoCoreData() {
        
        for product in products {
            
            MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
                
                var productsData = CDProducts.MR_findAllInContext(localContext)
                
                let productData = CDProducts.MR_createEntityInContext(localContext)
                productData.categoryId = self.categoryId
                productData.id = product.id
                productData.title = product.title
                productData.body = product.body
                
                if product.thumbnailsId.count > 0 {
                    
                    let thumbnailsData = NSMutableOrderedSet()
                    // Since we need to store thumbnailId and thumbnailImageView respectively
                    // We're using index in order to get the corrected index for each of them
                    for index in 0..<product.thumbnailsId.count {
                        
                        let thumbnailData = CDThumbnails.MR_createEntityInContext(localContext)
                        thumbnailData.id = product.thumbnailsId[index]
                        thumbnailData.imageView = product.thumbnails[index]
                        
                        thumbnailsData.addObject(thumbnailData)
                    }
                    
                    productData.thumbnails = thumbnailsData
                }
                
                productsData.append(productData)
                
                }, completion: { (success: Bool, error: NSError!) -> Void in
    
            })
        }
    }
    
    func setCategoryUpdate() {
        
        MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
            
            let categoryData = CDCategories.MR_findFirstByAttribute("id", withValue: self.categoryId, inContext: localContext)
            categoryData.hasUpdated = NSNumber(bool: true)
            
            }) { (success: Bool, error: NSError!) -> Void in
        }
    }
}
