//
//  FavoritesController_TableView.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension FavoritesController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        var product: Products?
        if searchController!.active {
            
            product = filteredProducts[indexPath.row]
            
        } else {
            
            product = products[indexPath.row]
        }
        
        var productDetailCell: UITableViewCell?
        if product?.thumbnails.count > 0 {
            
            productDetailCell = configureProductDetailCell(product!, at: indexPath)
        } else {
            
            productDetailCell = configureProductDetailWithoutThumbnailCell(product!, at: indexPath)
        }
        
        return productDetailCell!
    }
    
    func configureProductDetailCell(product: Products, at indexPath: NSIndexPath) -> ProductDetailCell {
        let cell: ProductDetailCell = tableView.dequeueReusableCellWithIdentifier("productDetailCell", forIndexPath: indexPath) as! ProductDetailCell
        
        // Set product detail values
        cell.titleLabel.text = product.title
        cell.bodyLabel.text = product.body
        cell.favoriteIcon.highlighted = true
        
        // Remove existing thumbnail image
        for previousThumbnail in cell.thumbnailContainer.subviews as [UIView] {
            previousThumbnail.removeFromSuperview()
        }
        
        
        for thumbnail in product.thumbnails {
            cell.thumbnailContainer.addSubview(thumbnail)
        }
        
        if let thumbnail = product.thumbnails.last?.frame {
            // Set scroll view content size to contain all thumbnails
            cell.thumbnailContainer.contentSize.height = thumbnail.size.height
            cell.thumbnailContainer.contentSize.width = thumbnail.origin.x + thumbnail.size.width
        }
        
        var favoritedProduct = false
        if let hasFavorite = product.hasFavorited {
            favoritedProduct = hasFavorite
        }
        cell.initFavoriteTapRecognizer(product.id, hasFavorited: favoritedProduct)
        
        return cell
    }
    
    func configureProductDetailWithoutThumbnailCell(product: Products, at indexPath: NSIndexPath) -> ProductDetailWithoutThumbnailCell {
        let cell: ProductDetailWithoutThumbnailCell = tableView.dequeueReusableCellWithIdentifier("productDetailWithoutThumbnailCell", forIndexPath: indexPath) as! ProductDetailWithoutThumbnailCell
        
        // Set product detail values
        cell.titleLabel.text = product.title
        cell.bodyLabel.text = product.body
        cell.favoriteIcon.highlighted = true
        
        var favoritedProduct = false
        if let hasFavorite = product.hasFavorited {
            favoritedProduct = hasFavorite
        }
        cell.initFavoriteTapRecognizer(product.id, hasFavorited: favoritedProduct)
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var product: Products?
        if searchController!.active {
            
            product = filteredProducts[indexPath.row]
            
        } else {
            
            product = products[indexPath.row]
        }
        
        if let thumbnails = product?.thumbnails {
            
            for index in 0..<thumbnails.count {
                
                // check version if it's true or false (need update)
                // fetch data inside core data
                let success = initThumbnailsCoreData(indexPath, index: index, productId: product!.id, thumbnailId: product!.thumbnailsId[index])
                
                // fetch data from JSON
                if !success {
                    fetchProductThumbnails(thumbnails[index], categoryId: product!.categoryId!, productId: product!.id, thumbnailId: product!.thumbnailsId[index], indexPath: indexPath, index: index)
                }
            }
        }
    }
}
