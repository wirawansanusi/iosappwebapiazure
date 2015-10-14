//
//  ProductsList_Indicator.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/14/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ProductsList {
    
    func showIndicatorOnThumbnail(thumbnail: UIImageView) -> UIActivityIndicatorView {
        
        let activityIndicator = UIActivityIndicatorView()
        let thumbnailSize = thumbnail.bounds.size
        let size = activityIndicator.bounds.size
        activityIndicator.frame = CGRect(origin: CGPoint(x: thumbnailSize.width / 2 - size.width / 2, y: thumbnailSize.height / 2 - size.height / 2), size: size)
        thumbnail.addSubview(activityIndicator)
        activityIndicator.color = GLOBAL_VALUES.COLOR.PRIMARY
        activityIndicator.startAnimating()
        
        return activityIndicator
    }
    
    func hideIndicator(activityIndicator: UIActivityIndicatorView) {
        
        activityIndicator.stopAnimating()
    }
}
