//
//  FavoritesController_FetchThumbnails.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension FavoritesController {
    
    func fetchProductThumbnails(thumbnail: UIImageView, categoryId: Int, productId: Int, thumbnailId: Int, indexPath: NSIndexPath, index: Int){
        
        // Add animation loading
        let activityIndicator = showIndicatorOnThumbnail(thumbnail)
        
        // Get the corresponding URL
        let url_string = GLOBAL_VALUES.API.POST.THUMBNAIL.SHOW.URL(categoryId, postId: productId, thumbnailId: thumbnailId)
        let url = NSURL(string: url_string)
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
                
                // Check if there's a value then type cast AnyObject into Dictionary
                if let json = json as? [String: AnyObject] {
                    
                    // Check if there's a value then type cast Data into Dictionary
                    if let imageData = json["data"] as? [String: AnyObject] {
                        
                        // Retreive the encoded string
                        let encoded = imageData["encoded"] as! String
                        
                        // Convert from URL into NSData
                        // Since the encoded string was based from HTML <img src>,
                        // It has to be converted first as NSURL data type
                        let encodedData = NSData(contentsOfURL: NSURL(string: encoded)!)
                        
                        // Convert from NSData into UIImage
                        let image = UIImage(data: encodedData!)
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            
                            self.setProductThumbnail(indexPath, index: index, thumbnailId: thumbnailId, image: image!)
                            self.fetchingNewThumbnailsVersion(image!, productId: productId, thumbnailId: thumbnailId)
                            self.hideIndicator(activityIndicator)
                        })
                    }
                    
                }
                
            }
            
            }.resume()  // Require to perform async NSURLSession
    }

    func setProductThumbnail(indexPath: NSIndexPath, index: Int, thumbnailId: Int, image: UIImage) {
        
        var product: Products?
        if self.searchController!.active {
            
            // Set the thumbnail image and remove the default background color
            product = self.filteredProducts[indexPath.row]
            
        } else {
            
            // Set the thumbnail image and remove the default background color
            product = self.products[indexPath.row]
        }
        let thumbnails = product!.thumbnails
        let thumbnail = thumbnails[index]
        
        thumbnail.tag = thumbnailId
        thumbnail.image = image
        thumbnail.contentMode = .ScaleAspectFit
        
        initTapRecognizer(thumbnail)
    }
}
