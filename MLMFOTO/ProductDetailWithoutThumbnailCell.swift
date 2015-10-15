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
    
    func initFavoriteTapRecognizer(productId: Int, hasFavorited: Bool) {
        self.productId = productId
        self.hasFavorited = hasFavorited
        markAsFavoriteProduct(self.hasFavorited)
        
        if favoriteIcon.gestureRecognizers?.count < 1 {
            tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("toggleFavorite:"))
            tapRecognizer!.numberOfTapsRequired = 1
            tapRecognizer!.numberOfTouchesRequired = 1
            
            favoriteIcon.userInteractionEnabled = true
            favoriteIcon.addGestureRecognizer(tapRecognizer!)
        }
    }
    
    func toggleFavorite(recognizer: UITapGestureRecognizer) {
        hasFavorited = !hasFavorited
        markAsFavoriteProduct(hasFavorited)
        addProductIntoFavorite(hasFavorited)
    }
    
    func markAsFavoriteProduct(favorite: Bool) {
        
        favoriteIcon.highlighted = favorite
    }
    
    func addProductIntoFavorite(favorite: Bool) {
        
        if let id = productId {
            
            MagicalRecord.saveWithBlock({ (localContext: NSManagedObjectContext!) -> Void in
                
                let productData = CDProducts.MR_findFirstByAttribute("id", withValue: id, inContext: localContext)
                if productData != nil {
                    
                    productData.hasFavorited = favorite
                }
                
                }, completion: { (contextDidSave: Bool, error: NSError!) -> Void in
            
            })
        }
    }
}
