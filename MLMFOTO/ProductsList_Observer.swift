//
//  ProductsList_Observer.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/13/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ProductsList {
    
    func initObserver() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardFrameWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardFrameWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardFrameWillShow(notification: NSNotification) {
        
        let info = notification.userInfo!
        let keyboardInset = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue
        
        tableView.contentInset.bottom = keyboardInset.height
    }
    
    func keyboardFrameWillHide(notification: NSNotification) {
        
        tableView.contentInset.bottom = 0
    }
    
    func removeAllObserver() {
        
        NSNotificationCenter().removeObserver(self)
    }
}
