//
//  SubCategoriesList_TableView.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension SubCategoriesList: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        stylingTableView()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let search = searchController {
            
            if search.active {
            
            return filteredSubCategories.count
            
            }
        }
        
        return subCategories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subCategoryCell", forIndexPath: indexPath)
        
        var subCategory: SubCategories?
        if searchController!.active {
            
            // Get FilteredSubCategory
            subCategory = filteredSubCategories[indexPath.row]
            
        } else {
            
            // Get SubCategory
            subCategory = subCategories[indexPath.row]
        }
        
        // Set SubCategory's title
        cell.textLabel?.text = subCategory!.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Auto deselecting after table view cell was tapped
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if searchController!.active {
            
            // Set the selected FilteredSubCategory
            selectedSubCategory = filteredSubCategories[indexPath.row]
            
        } else {
            
            // Set the selected SubCategory
            selectedSubCategory = subCategories[indexPath.row]
        }
        
        performSegueWithIdentifier("showProducts", sender: self)
    }
}
