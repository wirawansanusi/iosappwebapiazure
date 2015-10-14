//
//  SubCategoriesList_Main.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class SubCategoriesList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var subCategories: [SubCategories]!
    var filteredSubCategories = [SubCategories]()
    
    var selectedSubCategory: SubCategories?
    
    var searchController: LightSearchController?
    
    var isViewDidLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        initSearchController()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if isViewDidLoad {
            initSubCategoriesCoreData()
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
