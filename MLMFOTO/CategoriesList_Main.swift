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
    var selectedSubCategory: [SubCategories]?
    var selectedCategory: Categories?
    var tableViewShouldAnimate: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initStyling()
        initNavigationBar()
        initJSONData()
        initTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if tableViewShouldAnimate {
            initStyleForTableView()
            tableViewShouldAnimate = false
        }
    }
}

