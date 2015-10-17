//
//  ProductsList_Main.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MagicalRecord

class ProductsList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryId: Int!
    var latestVersion: Int!
    var products = [Products]()
    var filteredProducts =  [Products]()
    
    var selectedProduct: Products?
    
    // Used to present thumbnail image controller
    var selectedPostId: Int?
    var selectedThumbnailId :Int?
    var largeThumbnailHasUpdated: Bool?
    
    var searchController: LightSearchController?
    
    var isViewDidLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkVersion()
        initTableView()
        initSearchController()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // If we don't call this method, When the tab bar controller view changed,
        // the selected favorite thumbnailContainer subviews will not retaining the object.
        // Thus, we need to call this method in order to query the data once more again
        // and populate it into the array
        
        // call this if the view already loaded
        // if tab bar controller view has changed, it will get triggered
        if isViewDidLoad {
            checkVersion()
        }
        initObserver()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        dismissSearchController()
        stopFetchingUnfinishedSession()
        removeAllObserver()
        isViewDidLoad = true
    }
}

