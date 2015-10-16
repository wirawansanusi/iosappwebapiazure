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
    var hasUpdated: Bool!
    var products = [Products]()
    var filteredProducts =  [Products]()
    
    var selectedProduct: Products?
    
    // Used to present thumbnail image controller
    var selectedPostId: Int?
    var selectedThumbnailId :Int?
    var largeThumbnailHasUpdated: Bool?
    
    var searchController: LightSearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if hasUpdated == true {
        
        // First we need to check the latest version
        // If it's already updated with the latest version,
        // We want to show the Core Data
        
            initProductsCoreData()
        
        } else {
            
        // Else, we want to update it into the latest version
        // by fetching the JSON data
        // And replacing the newest data by deleting the current ones
        // And addding the newest data from the beginning
        
            initJSONData()
        }
        
        initTableView()
        initSearchController()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // If we don't call this method, When the tab bar controller view changed,
        // the selected favorite thumbnailContainer subviews will not retaining the object.
        // Thus, we need to call this method in order to query the data once more again
        // and populate it into the array
        initProductsCoreData()
        initObserver()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        dismissSearchController()
        stopFetchingUnfinishedSession()
        removeAllObserver()
    }
}

