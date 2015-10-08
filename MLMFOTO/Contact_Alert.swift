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
        
        let alert = UIAlertController(title: GLOBAL_VALUES.CONTACT.NUMBER.ALERT.TITLE, message: GLOBAL_VALUES.CONTACT.NUMBER.ALERT.MESSAGE, preferredStyle: .Alert)
        
        let callAction = UIAlertAction(title: "Call", style: UIAlertActionStyle.Default) { (alert: UIAlertAction) -> Void in
            
            UIApplication.sharedApplication().openURL(NSURL(string: GLOBAL_VALUES.CONTACT.NUMBER.WORK)!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        alert.addAction(callAction)
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
