//
//  Contact_InitRecognizer.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/7/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ContactController {
    
    func initRecognizer(){
        
        let callRecognizer = UITapGestureRecognizer(target: self, action: Selector("didTapCallView:"))
        callRecognizer.numberOfTapsRequired = 1
        callRecognizer.numberOfTouchesRequired = 1
        callView.addGestureRecognizer(callRecognizer)
        
        let directionRecognizer = UITapGestureRecognizer(target: self, action: Selector("didTapDirectionView:"))
        directionRecognizer.numberOfTapsRequired = 1
        directionRecognizer.numberOfTouchesRequired = 1
        directionView.addGestureRecognizer(directionRecognizer)
    }
}
