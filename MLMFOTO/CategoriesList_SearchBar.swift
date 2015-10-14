//
//  CategoriesList_SearchBar.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/13/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList: UISearchResultsUpdating, UISearchBarDelegate {
    
    func initSearchController() {
        
        searchController = LightSearchController(searchResultsController: nil)
        
        searchController?.searchResultsUpdater = self
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.dimsBackgroundDuringPresentation = false
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.delegate = self
        stylingSearchBar()
        
        tableView.tableHeaderView = searchController?.searchBar
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        filteredCategories = categories.filter { (category: Categories) -> Bool in
    
            let matchedString = category.title.rangeOfString(searchController.searchBar.text!, options: .CaseInsensitiveSearch)
            
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

