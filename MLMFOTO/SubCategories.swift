//
//  SubCategories.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class SubCategories: Categories {

    var parent_title: String
    
    init(id: Int, title: String, parent_title: String, version: Int){
        self.parent_title = parent_title
        super.init(id: id, title: title, version: version)
    }
}
