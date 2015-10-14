//
//  ProductsList_InitRecognizer.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/10/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ProductsList {
    
    func initTapRecognizer(imageView: UIImageView) {
        
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("willPresentThumbnailImageController:"))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(recognizer)
    }
    
    func willPresentThumbnailImageController(recognizer: UITapGestureRecognizer) {
        
        let location = recognizer.locationInView(tableView)
        let imageView = recognizer.view as! UIImageView
        let index = tableView.indexPathForRowAtPoint(location)?.row
        
        var product: Products?
        if searchController!.active {
            
            product = filteredProducts[index!]
            
        } else {
            
            product = products[index!]
        }
        
        selectedPostId = product!.id
        selectedThumbnailId = imageView.tag
    
        performSegueWithIdentifier("showThumbnailImageController", sender: self)
    }
}
