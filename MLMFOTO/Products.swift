//
//  Products.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class Products {
    
    var id: Int
    var title: String
    var body: String
    var thumbnailsId: [Int]
    var thumbnails = [UIImageView]()
    
    init(id: Int, title: String, body: String, thumbnailsId: [Int]){
        
        self.id = id
        self.title = title
        self.body = body
        self.thumbnailsId = thumbnailsId
    }
}
