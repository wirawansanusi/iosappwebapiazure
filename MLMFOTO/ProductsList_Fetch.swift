//
//  ProductsList_Fetch.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ProductsList {
    
    func initJSONData() {
        
        // Construct the product URL
        let productURL = GLOBAL_VALUES.API.POST.DETAIL.INDEX.URL(categoryId)
        
        fetchProduct(productURL)
    }
    
    func fetchProduct(url: String) {
        
        // Preparing URL Session
        let url = NSURL(string: url)
        let urlRequest = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        
        // Fetch the data using NSURLSession
        session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if error == nil {
                
                // Init a JSON object
                let json: AnyObject?
                
                // SUCCESS: Parse the fetched data and put it into JSON Object
                // FAIL:    Set nil
                do {
                    
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                    
                } catch _ {
                    
                    json = nil
                }
                
                // Check if there's a value then type cast AnyObject into NSArray
                if let json = json as? NSArray {
                    
                    // Check if there's a value then type cast NSArray into [NSDictionary]
                    if let products = json as? [NSDictionary] {
                        
                        for product in products {
                            
                            // Use the Id from Product Detail to retrieve its information
                            let id_string = product["id"] as! String
                            let id = Int(id_string)!
                            let title_uppercase = product["title"] as! String
                            let title = title_uppercase.capitalizedString
                            let body = product["body"] as! String
                            let version = self.latestVersion
                            let thumbnailsId = product["thumbnails"] as! [Int]
                            
                            // Init product object
                            let product = Products(id: id, title: title, body: body, version: version, thumbnailsId: thumbnailsId)
                            product.hasFavorited = false
                            self.configureProductThumbnail(product)
                        }
                        
                        self.fetchingNewProductsVersion()
                        self.reinitTableView()
                    }
                    
                }
                
            }
            
        }.resume() // Require to perform async NSURLSession
        
    }
    
    func configureProductThumbnail(product: Products) {
        
        if product.thumbnailsId.count > 0 {
            
            var thumbnails = [UIImageView]()
            for index in 0..<product.thumbnailsId.count {
                let size: CGFloat = 150
                let thumbnail = UIImageView(frame: CGRect(origin: CGPoint(x: size * CGFloat(index) + 20.0, y: 0), size: CGSize(width: size, height: size)))
                thumbnails.append(thumbnail)
            }
            product.thumbnails = thumbnails
        }
        
        products.append(product)
    }
    
    // We call this if the search controller is going to display the filtered products
    // and also when the view is going to navigate back to the previous view
    func stopFetchingUnfinishedSession () {
        
        let session = NSURLSession.sharedSession()
        session.getAllTasksWithCompletionHandler { (URLSessions: [NSURLSessionTask]) -> Void in
            for URLSession in URLSessions {
                URLSession.cancel()
            }
        }
    }
}
