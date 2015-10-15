//
//  ViewController.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class CategoriesList: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var categories = [Categories]()
    var filteredCategories = [Categories]()
    var selectedSubCategory: [SubCategories]?
    var selectedCategory: Categories?
    var tableViewShouldAnimate: Bool = false
    
    var searchController: LightSearchController?
    
    var isViewDidLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
        initStyling()
        
        // First we need to check the latest version
        // If it has the latest version,
        // We want to show the Core Data
        
            initCoreData()
        
        // Else, we want to update into the latest version
        // From fetching the JSON data
        // And replacing the newest data by deleting the current ones
        // And addding the newest data from the beginning
        
            //initJSONData()
        
        initTableView()
        initSearchController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if tableViewShouldAnimate {
            initStyleForTableView()
            tableViewShouldAnimate = false
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if isViewDidLoad {
            checkUpdateVersion()
        }
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

