//
//  ProductDetailCell.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/3/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class ProductDetailCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var thumbnailContainer: UIScrollView!
    var thumbnailsImage = [UIImage?]()
}
