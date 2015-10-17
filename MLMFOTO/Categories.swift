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
    var version: Int
    
    init(id: Int, title: String, version: Int) {
        
        self.id = id
        self.title = title
        self.version = version
        self.subCategories = [SubCategories]()
    }
}
