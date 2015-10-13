//
//  CategoriesList_TableView.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        stylingTableView()
    }
    
    func reinitTableView() {
        
        tableView.performSelectorOnMainThread(Selector("reloadData"), withObject: nil, waitUntilDone: false)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let search = searchController {
            
            if search.active {
            
                return filteredCategories.count
            }
            
        }
            
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)
        
        var category: Categories?
        if searchController!.active {
    
            // Get Filtered Category
            category = filteredCategories[indexPath.row]
            
        } else {
            
            // Get Category
            category = categories[indexPath.row]
        }
        
        // Set Category's title
        cell.textLabel?.text = category!.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Auto deselecting after table view cell was tapped
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if searchController!.active {
            
            // Get the Subcategories from Category
            selectedCategory = filteredCategories[indexPath.row]
            
        } else {
            
            // Get the Subcategories from FilteredCategory
            selectedCategory = categories[indexPath.row]
        }
    
        selectedSubCategory = selectedCategory?.subCategories
        
        // If there's a SubCategories
        if selectedCategory!.subCategories?.count > 0 {
            
            // Show SubCategories Controller
            performSegueWithIdentifier("showSubCategories", sender: self)
            
        } else {
            
            // Else, show Products Controller
            performSegueWithIdentifier("showProducts", sender: self)
        }
    }
    
}
