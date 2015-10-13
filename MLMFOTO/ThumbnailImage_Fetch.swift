//
//  ThumbnailImage_Fetch.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ThumbnailImageController {
    
    func loadJSONData() {
        
        let urlPath = GLOBAL_VALUES.API.POST.THUMBNAIL.SHOWLARGE.URL(categoryId, postId: postId, thumbnailId: thumbnailId)
        
        loadThumbnailImage(urlPath)
    }
    
    func loadThumbnailImage(urlPath: String) {
        
        let url = NSURL(string: urlPath)
        let urlRequest = NSURLRequest(URL: url!)
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        showIndicator()
        session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if error == nil {
                
                let json: AnyObject?
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
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
                            
                            // Set the thumbnail image
                            self.thumbnailImage = image
                            self.hideIndicator()
                            self.showImageIntoContainer()
                        })
                    }
                    
                }
                
            }
            
        }.resume()
        
    }
}
