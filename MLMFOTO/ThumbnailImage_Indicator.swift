//
//  ThumbnailImage_Indicator.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ThumbnailImageController {
    
    func showIndicator() {
        
        thumbnailImageIndicator.alpha = 1
        thumbnailImageIndicator.startAnimating()
    }
    
    func hideIndicator() {
        
        thumbnailImageIndicator.stopAnimating()
        thumbnailImageIndicator.alpha = 0
    }
}
