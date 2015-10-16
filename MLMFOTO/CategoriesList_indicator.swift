//
//  CategoriesList_indicator.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/16/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList {
    
    func showIndicator() {
        
        loadingIndicator.alpha = 1
        loadingIndicator.startAnimating()
    }
    
    func hideIndicator() {
        
        loadingIndicator.stopAnimating()
        loadingIndicator.alpha = 0
    }
}
