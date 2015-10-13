//
//  Contact_Alert.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/7/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ContactController {
    
    func showAlertFromCallView() {
        
        let alert = UIAlertController(title: GLOBAL_VALUES.CONTACT.SHOWROOM.ALERT.TITLE, message: GLOBAL_VALUES.CONTACT.SHOWROOM.ALERT.MESSAGE, preferredStyle: .Alert)
        
        let callAction = UIAlertAction(title: "Call", style: UIAlertActionStyle.Default) { (alert: UIAlertAction) -> Void in
            
            UIApplication.sharedApplication().openURL(GLOBAL_VALUES.CONTACT.SHOWROOM.URL)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alert.addAction(callAction)
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showAlertFromOpenUrl() {
        
        let alert = UIAlertController(title: "Tidak dapat membuka aplikasi", message: "Pastikan aplikasi yang dituju sudah terinstall terlebih dahulu.", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
