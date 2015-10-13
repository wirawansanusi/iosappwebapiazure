//
//  CategoriesList_Style.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/6/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList {
    
    func initStyling() {
        
        UIView.animateWithDuration(1.0) { () -> Void in
            self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        }
    }
    
    func initStyleForTableView() {
        
        let defaultTopInset = tableView.contentInset.top
        tableView.contentInset.top = 100.0
        tableView.alpha = 0.0
        tableView.tableHeaderView?.alpha = 0.0
        UIView.animateWithDuration(0.7) { () -> Void in
            self.tableView.contentInset.top = defaultTopInset
            self.tableView.alpha = 1.0
            self.tableView.tableHeaderView?.alpha = 1.0
            
        }
    }
    
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
