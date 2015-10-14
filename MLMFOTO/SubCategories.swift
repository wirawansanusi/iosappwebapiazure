//
//  SubCategories.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class SubCategories {

    var id: Int
    var title: String
    var hasUpdated: Bool
    var parent_title: String
    
    init(id: Int, title: String, parent_title: String, hasUpdated: Bool){
        
        self.id = id
        self.title = title
        self.hasUpdated = hasUpdated
        self.parent_title = parent_title
    }
}
