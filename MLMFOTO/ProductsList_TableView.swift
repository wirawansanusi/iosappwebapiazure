//
//  ProductsList_TableView.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ProductsList: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Uses for dynamic sizing cell's size
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func reinitTableView() {
        
        tableView.performSelectorOnMainThread(Selector("reloadData"), withObject: nil, waitUntilDone: false)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let product = products[indexPath.row]
        let cell = configureProductDetailCell(product, at: indexPath)
        
        return cell
    }
    
    func configureProductDetailCell(productDetail: [String: AnyObject], at indexPath: NSIndexPath) -> ProductDetailCell {
        let cell: ProductDetailCell = tableView.dequeueReusableCellWithIdentifier("productDetailCell", forIndexPath: indexPath) as! ProductDetailCell
        
        // Set product detail values
        cell.titleLabel.text = productDetail["title"] as? String
        cell.bodyLabel.text = productDetail["body"] as? String
        
        
        for previousThumbnail in cell.thumbnailContainer.subviews as [UIView] {
            previousThumbnail.removeFromSuperview()
        }
        if let thumbnails = productDetail["thumbnails"] as? [UIImageView] {
        
            for index in 0..<thumbnails.count {
            
                cell.thumbnailContainer.addSubview(thumbnails[index])
            }
        
            // Set scroll view content size to contain all thumbnails
            cell.thumbnailContainer.contentSize.height = thumbnails.last!.frame.size.height
            cell.thumbnailContainer.contentSize.width = thumbnails.last!.frame.origin.x + thumbnails.last!.frame.size.width
        } else {
            
            // error here
            print(tableView.indexPathForCell(cell))
            //print("Delete \(cell.thumbnailContainer.tag)")
            cell.thumbnailContainer.removeConstraints(cell.thumbnailContainer.constraints)
            //cell.thumbnailContainer.bounds.size.height = 0
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let product = products[indexPath.row]
        
        let productTitle = product["title"] as! String
        let productId = product["id"] as! Int
        print("\(productId) - \(productTitle)")
        
        if let thumbnails = product["thumbnails"] as? [UIImageView] {
            
            let thumbnailsId = product["thumbnailsId"] as! [Int]
            for index in 0..<thumbnails.count {
            
                if thumbnails[index].image == nil {
                
                    fetchProductThumbnails(thumbnails[index], productId: productId, thumbnailId: thumbnailsId[index], indexPath: indexPath, index: index)
                }
            }
        }
    }
}
