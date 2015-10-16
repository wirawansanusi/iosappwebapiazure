//
//  ProductDetailWithoutThumbnailCell.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/10/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

class ProductDetailWithoutThumbnailCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var favoriteIcon: UIImageView!
    
    var hasFavorited = false
    var tapRecognizer: UITapGestureRecognizer?
    var productId: Int?
    
    // Add tap gesture recognizer
    func initFavoriteTapRecognizer(productId: Int, hasFavorited: Bool) {
        
        // Set the required attribute value for future use
        self.productId = productId
        self.hasFavorited = hasFavorited
        markAsFavoriteProduct(self.hasFavorited)
        
        // Check if there's already a gesture attached into the favorite icon
        if favoriteIcon.gestureRecognizers?.count < 1 {
            tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("toggleFavorite:"))
            tapRecognizer!.numberOfTapsRequired = 1
            tapRecognizer!.numberOfTouchesRequired = 1
            
            favoriteIcon.userInteractionEnabled = true
            favoriteIcon.addGestureRecognizer(tapRecognizer!)
        }
    }
    
    // Call this function when tap gesture occurs
    func toggleFavorite(recognizer: UITapGestureRecognizer) {
        
        // toggle the attibute everytime the tap gesture occurs
        hasFavorited = !hasFavorited
        markAsFavoriteProduct(hasFavorited)
        addProductIntoFavorite(hasFavorited)
    }
    
    // Set the star icon into highlighted
    func markAsFavoriteProduct(favorite: Bool) {
        
        favoriteIcon.highlighted = favorite
    }
    
    // Set CDProducts hasFavorited value
    func addProductIntoFavorite(favorite: Bool) {
        
        // Make sure the product id is not nil
        // because the product id is needed in order to filter the CDProducts
        if let id = productId {
            
            MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
                
                let productData = CDProducts.MR_findFirstByAttribute("id", withValue: id, inContext: localContext)
                
                // Once again make sure the data is exist
                if productData != nil {
                    productData.hasFavorited = favorite
                }
                
                }, completion: { (contextDidSave: Bool, error: NSError!) -> Void in
            })
        }
    }
}
