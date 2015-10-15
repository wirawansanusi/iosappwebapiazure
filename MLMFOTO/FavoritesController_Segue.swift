//
//  FavoritesController_Segue.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension FavoritesController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showThumbnailImageController" {
            
            let destination = segue.destinationViewController as! ThumbnailImageController
            destination.categoryId = categoryId
            destination.postId = selectedPostId
            destination.thumbnailId = selectedThumbnailId
        }
    }
}