//
//  SubCategoriesList_SearchBar.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/13/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension SubCategoriesList: UISearchResultsUpdating, UISearchBarDelegate {
    
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
        
        filteredSubCategories = subCategories.filter({ (subCategory: SubCategories) -> Bool in
            
            let matchedString = subCategory.title.rangeOfString(searchController.searchBar.text!, options: .CaseInsensitiveSearch)
            
            return (matchedString != nil)
        })
        
        tableView.reloadData()
    }
    
    func dismissSearchController() {
     
        searchController?.active = false
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
}
