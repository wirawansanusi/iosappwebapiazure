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
    
    func stylingTableView() {
        
        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0, bottom: 0, right: 0)
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func reinitTableView() {
        
        tableView.performSelectorOnMainThread(Selector("reloadData"), withObject: nil, waitUntilDone: false)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath)
        
        // Get Category
        let category = categories[indexPath.row]
        
        // Set Category's title
        cell.textLabel?.text = category.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Auto deselecting after table view cell was tapped
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Get the Subcategories from Category
        selectedCategory = categories[indexPath.row]
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
