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
        
        let imageView = recognizer.view as! UIImageView
        let productIndex = tableView.indexPathForRowAtPoint(imageView.frame.origin)?.row
        let product = products[productIndex!]
        selectedPostId = product["id"] as? Int
        selectedThumbnailId = imageView.tag
    
        performSegueWithIdentifier("showThumbnailImageController", sender: self)
    }
}
