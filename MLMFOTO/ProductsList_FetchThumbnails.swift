//
//  ProductsList_FetchThumbnails.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/5/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ProductsList {
    
    func fetchProductThumbnails(thumbnail: UIImageView, productId: Int, thumbnailId: Int, indexPath: NSIndexPath, index: Int){
        
        let activityIndicator = UIActivityIndicatorView()
        let thumbnailSize = thumbnail.bounds.size
        let size = activityIndicator.bounds.size
        activityIndicator.frame = CGRect(origin: CGPoint(x: thumbnailSize.width / 2 - size.width / 2, y: thumbnailSize.height / 2 - size.height / 2), size: size)
        thumbnail.addSubview(activityIndicator)
        activityIndicator.color = GLOBAL_VALUES.COLOR.PRIMARY
        activityIndicator.startAnimating()
        
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
                            
                            // Set the thumbnail image and remove the default background color
                            let product = self.products[indexPath.row]
                            let thumbnails = product["thumbnails"] as! [UIImageView]
                            let thumbnail = thumbnails[index]
                            
                            thumbnail.image = image!
                            thumbnail.contentMode = .ScaleAspectFit
                            activityIndicator.removeFromSuperview()
                        })
                    }
                    
                }
                
            }
            
        }.resume()  // Require to perform async NSURLSession
    }
}
