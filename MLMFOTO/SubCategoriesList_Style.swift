//
//  SubCategoriesList_Style.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//


import UIKit

extension SubCategoriesList {
    
    func stylingTableView() {
        
        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0, bottom: 0, right: 0)
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func stylingSearchBar() {
        
        searchController?.searchBar.barTintColor = UIColor.groupTableViewBackgroundColor()
        searchController?.searchBar.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        searchController?.searchBar.layer.borderWidth = 1.0
    }
}