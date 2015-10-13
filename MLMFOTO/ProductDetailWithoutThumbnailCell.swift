//
//  ProductDetailWithoutThumbnailCell.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/10/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class ProductDetailWithoutThumbnailCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var favoriteIcon: UIImageView!
    
    var isFavorited = false
    var tapRecognizer: UITapGestureRecognizer?
    
    func initFavoriteTapRecognizer() {
        if favoriteIcon.gestureRecognizers?.count < 1 {
            tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("toggleFavorite:"))
            tapRecognizer!.numberOfTapsRequired = 1
            tapRecognizer!.numberOfTouchesRequired = 1
            
            favoriteIcon.userInteractionEnabled = true
            favoriteIcon.addGestureRecognizer(tapRecognizer!)
        }
    }
    
    func toggleFavorite(recognizer: UITapGestureRecognizer) {
        isFavorited = !isFavorited
        if isFavorited {
            favoriteIcon.highlighted = true
        } else {
            favoriteIcon.highlighted = false
        }
    }
}
