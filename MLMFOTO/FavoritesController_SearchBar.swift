//
//  FavoritesController_SearchBar.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension FavoritesController: UISearchResultsUpdating, UISearchBarDelegate {
    
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
        
        filteredProducts = products.filter { (product: Products) -> Bool in
            
            let title = product.title
            let matchedString = title.rangeOfString(searchController.searchBar.text!, options: .CaseInsensitiveSearch)
            
            return (matchedString != nil)
        }
        
        tableView.reloadData()
    }
    
    func dismissSearchController() {
        
        searchController?.active = false
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
}