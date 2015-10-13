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
        
        if let search = searchController {
            
            if search.active {
                
                return filteredProducts.count
            }
        }
        
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var product = [String: AnyObject]()
        if searchController!.active {
            
            product = filteredProducts[indexPath.row]
            
        } else {
            
            product = products[indexPath.row]
        }
        
        var productDetailCell: UITableViewCell?
        if let _ = product["thumbnails"] as? [UIImageView] {
            
            productDetailCell = configureProductDetailCell(product, at: indexPath)
        } else {
            
            productDetailCell = configureProductDetailWithoutThumbnailCell(product, at: indexPath)
        }
        
        return productDetailCell!
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
        }
        
        cell.initFavoriteTapRecognizer()
        
        return cell
    }
    
    func configureProductDetailWithoutThumbnailCell(productDetail: [String: AnyObject], at indexPath: NSIndexPath) -> ProductDetailWithoutThumbnailCell {
        let cell: ProductDetailWithoutThumbnailCell = tableView.dequeueReusableCellWithIdentifier("productDetailWithoutThumbnailCell", forIndexPath: indexPath) as! ProductDetailWithoutThumbnailCell
        
        // Set product detail values
        cell.titleLabel.text = productDetail["title"] as? String
        cell.bodyLabel.text = productDetail["body"] as? String
        
        cell.initFavoriteTapRecognizer()
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var product = [String: AnyObject]()
        if searchController!.active {
            
            product = filteredProducts[indexPath.row]
            
        } else {
            
            product = products[indexPath.row]
        }
        
        let productId = product["id"] as! Int
        
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
