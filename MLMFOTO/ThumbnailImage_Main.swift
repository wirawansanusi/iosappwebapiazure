//
//  ThumbnailImage_Main.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class ThumbnailImageController: UIViewController {
    
    @IBOutlet weak var thumbnailImageContainer: UIScrollView!
    @IBOutlet weak var thumbnailImageIndicator: UIActivityIndicatorView!
    
    var categoryId: Int!
    var postId: Int!
    var thumbnailId: Int!
    
    var thumbnailImage: UIImage?
    var thumbnailImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadJSONData()
    }
}
