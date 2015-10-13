//
//  ProductsList_Style.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/13/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ProductsList {
    
    func stylingSearchBar() {
        
        searchController?.searchBar.barTintColor = UIColor.groupTableViewBackgroundColor()
        searchController?.searchBar.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        searchController?.searchBar.layer.borderWidth = 1.0
    }
}
