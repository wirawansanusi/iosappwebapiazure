//
//  CategoriesList_Fetch.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList {
    
    func initJSONData() {
        
        let activityIndicator = UIActivityIndicatorView()
        let center = self.view.center
        let size = activityIndicator.bounds.size
        activityIndicator.frame = CGRect(origin: CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2), size: size)
        self.view.addSubview(activityIndicator)
        activityIndicator.color = GLOBAL_VALUES.COLOR.PRIMARY
        activityIndicator.startAnimating()
        
        // Get the corresponding URL
        let url = NSURL(string: GLOBAL_VALUES.API.CATEGORY.INDEX.URL())
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
                
                // Check if there's a value and type cast JSON into NSArray
                if let json = json as? NSArray {
                    
                    // Check if there's a value and type cast NSArray into [NSDictionary]
                    if let categories = json as? [NSDictionary] {
                        
                        for category in categories {
                            
                            // Parse ID & Title from JSON
                            let id_string = category["id"] as! String
                            let id = Int(id_string)!
                            let title = category["title"] as! String
                            let children = category["child"] as! [NSDictionary]
                            
                            // Init Category class
                            let category = Categories(id: id, title: title)
                            
                            // Check if Category has a children
                            if children.count > 0 {
                                
                                // If so, create a Subcategories array
                                var subCategories = [SubCategories]()
                                
                                for child in children {
                                    
                                    // Parse ID & Title from JSON
                                    let id_string = child["child_id"] as! String
                                    let id = Int(id_string)!
                                    let title = child["title"] as! String
                                    let parent_title = child["parent_title"] as! String
                                    
                                    // Init Subcategory class
                                    let subCategory = SubCategories(id: id, title: title, parent_title: parent_title)
                                    
                                    // Put it into the array
                                    subCategories.append(subCategory)
                                    
                                } // END FOR..IN SubCategories
                                
                                // Once the looping has finished,
                                // Assign the array into the Category's Subcategories
                                category.subCategories = subCategories
                                
                            } // END IF SubCategories.count
                            
                            // Put it into the Categories array
                            self.categories.append(category)
                            
                            // Remove Activity indicator animation
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                activityIndicator.removeFromSuperview()
                            })
                            
                        } // END FOR..IN Categories
                        
                        self.tableViewShouldAnimate = true
                        self.reinitTableView()
                        
                        
                    } // END IF..LET NSArray -> [NSDictionary]
                    
                } // END IF..LET AnyObject? -> NSArray
                
            } // END IF NO Error
            
        }.resume() // Require to perform async NSURLSession
    
    }
}
