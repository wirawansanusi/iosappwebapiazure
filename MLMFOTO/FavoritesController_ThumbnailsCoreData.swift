//
//  FavoritesController_ThumbnailsCoreData.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

extension FavoritesController {
    
    func initThumbnailsCoreData(indexPath: NSIndexPath, index: Int, productId: Int, thumbnailId: Int) -> Bool {
        
        let thumbnailData = CDThumbnails.MR_findFirstByAttribute("id", withValue: thumbnailId)
        if thumbnailData != nil {
            
            let imageData = thumbnailData.imageData
            if let imageExist = imageData {
                
                let image = UIImage(data: imageExist)!
                setProductThumbnail(indexPath, index: index, thumbnailId: thumbnailId, image: image)
                return true
                
            } else {
                return false
            }
        }
        return false
    }
    
    func fetchingNewThumbnailsVersion(image: UIImage, productId: Int, thumbnailId: Int) {
        
        saveThumbnailsIntoCoreData(image, productId: productId, thumbnailId: thumbnailId)
    }
    
    func saveThumbnailsIntoCoreData(image: UIImage, productId: Int, thumbnailId: Int) {
        
        MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
            
            let thumbnailData = CDThumbnails.MR_findFirstByAttribute("id", withValue: thumbnailId, inContext: localContext)
            
            let imageData = UIImageJPEGRepresentation(image, 100)
            thumbnailData.imageData = imageData
            thumbnailData.largeImageData = nil
            
            }) { (success: Bool, error: NSError!) -> Void in
        }
    }
}