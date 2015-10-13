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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
        initStyling()
        initJSONData()
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
    
    override func viewDidAppear(animated: Bool) {
        
        initObserver()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        // Dismiss SearchController if it's in active state
        dismissSearchController()
        removeAllObserver()
    }
}

