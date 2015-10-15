//
//  FavoritesController_Main.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController {
    
    @IBOutlet weak var WarningView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var products = [Products]()
    var filteredProducts =  [Products]()
    
    // Used to present thumbnail image controller
    var categoryId: Int?
    var selectedPostId: Int?
    var selectedThumbnailId :Int?
    var largeThumbnailHasUpdated: Bool?
    
    var searchController: LightSearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        initFavoriteProductsCoreData()
        initTableView()
        initSearchController()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        initFavoriteProductsCoreData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        initObserver()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        dismissSearchController()
        removeAllObserver()
    }
}
