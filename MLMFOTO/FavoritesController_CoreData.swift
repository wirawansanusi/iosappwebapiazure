//
//  FavoritesController_CoreData.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

extension FavoritesController {
    
    func initFavoriteProductsCoreData() {
        
        let predicate = NSPredicate(format: "hasFavorited = true")
        let productsData = CDProducts.MR_findAllSortedBy("title", ascending: true, withPredicate: predicate) as? [CDProducts]
        
        self.products = [Products]()
        if let productsData = productsData {
            if productsData.count > 0 {
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
                    
                    let catId_number = productData.categoryId!
                    let catId = Int(catId_number)
                    product.categoryId = catId
                    
                    products.append(product)
                }
                
                tableView.alpha = 1
                reinitTableView()
                
            } else {
                tableView.alpha = 0
            }
        }
    }
}
