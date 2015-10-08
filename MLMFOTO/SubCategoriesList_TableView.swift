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
    
    func stylingTableView() {
        
        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0, bottom: 0, right: 0)
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return subCategories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("subCategoryCell", forIndexPath: indexPath)
        
        // Get SubCategory
        let subCategory = subCategories[indexPath.row]
        
        // Set SubCategory's title
        cell.textLabel?.text = subCategory.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Auto deselecting after table view cell was tapped
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Set the selected SubCategory
        selectedSubCategory = subCategories[indexPath.row]
        
        performSegueWithIdentifier("showProducts", sender: self)
    }
}
