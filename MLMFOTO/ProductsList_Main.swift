//
//  ProductsList_Main.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class ProductsList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryId: Int!
    var products = [[String: AnyObject]]()
    var filteredProducts =  [[String: AnyObject]]()
    
    var selectedProduct: Products?
    
    // Used to present thumbnail image controller
    var selectedPostId: Int?
    var selectedThumbnailId :Int?
    
    var searchController: LightSearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initJSONData()
        initTableView()
        initSearchController()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        initObserver()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        dismissSearchController()
        stopFetchingUnfinishedSession()
        removeAllObserver()
    }
}

