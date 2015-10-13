//
//  ProductsList_SearchBar.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/13/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ProductsList: UISearchResultsUpdating, UISearchBarDelegate {
    
    func initSearchController() {
        
        searchController = LightSearchController(searchResultsController: nil)
        
        searchController?.searchResultsUpdater = self
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.dimsBackgroundDuringPresentation = false
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.delegate = self
        stylingSearchBar()
        
        tableView.tableHeaderView = searchController!.searchBar
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            if let search = self.searchController {
                
                let height = search.searchBar.frame.height
                self.tableView.setContentOffset(CGPoint(x: 0, y: height), animated: false)
            }
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        filteredProducts = products.filter { (product: [String: AnyObject]) -> Bool in
            
            let title = product["title"] as! String
            let matchedString = title.rangeOfString(searchController.searchBar.text!)
            
            return (matchedString != nil)
        }
        
        stopFetchingUnfinishedSession()
        tableView.reloadData()
    }
    
    func dismissSearchController() {
        
        searchController?.active = false
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
}
