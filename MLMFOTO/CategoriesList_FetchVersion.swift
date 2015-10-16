//
//  CategoriesList_FetchVersion.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/15/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList {
    
    func fetchVersion() {
        
        let urlString = GLOBAL_VALUES.API.VERSION.INDEX.URL()
        let url = NSURL(string: urlString)
        let urlRequest = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithRequest(urlRequest) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            if error == nil {
                
                var json: AnyObject?
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                } catch _ {
                    json = nil
                }
                
                
                if let json = json as? [String: String] {
                    
                    let newestVersion_string = json["version"]!
                    let newestVersion = Int(newestVersion_string)
                    
                    self.checkVersion(newestVersion!)
                }
            }
        }.resume()
    }
    
    func checkVersion(newestVersion: Int) {
        
        self.newestVersion = newestVersion
        let userDefault = NSUserDefaults.standardUserDefaults()
        let currentVersion = userDefault.integerForKey("version")
    
        print(currentVersion)
        print(newestVersion)
        // First we need to check the latest version
        // If it has the latest version,
        // We want to show the Core Data
        if currentVersion >= newestVersion {
            print("version is already updated")
            initCoreData()
            
        // Else, we want to update into the latest version
        // From fetching the JSON data
        // And replacing the newest data by deleting the current ones
        // And addding the newest data from the beginning
        } else {
            print("updating into new version")
            initJSONData()
        }
    }
    
    func setintoLatestVersion() {
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setInteger(self.newestVersion!, forKey: "version")
    }
}
