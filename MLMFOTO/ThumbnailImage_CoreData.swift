//
//  ThumbnailImage_CoreData.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

extension ThumbnailImageController {
    
    func initLargeThumbnailsCoreData() {
        
        let thumbnailData = CDThumbnails.MR_findFirstByAttribute("id", withValue: thumbnailId)
        
        if let imageData = thumbnailData.largeImageData {
            
            let image = UIImage(data: imageData)
            initThumbnailImage(image!)
            
        } else {
            
            initJSONData()
        }
    }
    
    func fetchingNewLargeThumbnailsVersion(image: UIImage, thumbnailId: Int) {
        
        saveLargeThumbnailsIntoCoreData(image, thumbnailId: thumbnailId)
    }
    
    func saveLargeThumbnailsIntoCoreData(image: UIImage, thumbnailId: Int) {
        
        MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
            
            let thumbnailData = CDThumbnails.MR_findFirstByAttribute("id", withValue: thumbnailId, inContext: localContext)
            
            let imageData = UIImageJPEGRepresentation(image, 100)
            thumbnailData.largeImageData = imageData
            
            }) { (success: Bool, error: NSError!) -> Void in
        }
    }
}
