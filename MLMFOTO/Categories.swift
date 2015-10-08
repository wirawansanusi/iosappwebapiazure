//
//  Categories.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class Categories {
    
    var id: Int
    var title: String
    var subCategories: [SubCategories]?
    
    init(id: Int, title: String) {
        
        self.id = id
        self.title = title
        self.subCategories = [SubCategories]()
    }
}
