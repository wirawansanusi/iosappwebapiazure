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
    var selectedSubCategory: SubCategories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
    }
}
