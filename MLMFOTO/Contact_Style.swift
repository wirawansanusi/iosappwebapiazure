//
//  Contact_Style.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/6/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ContactController {
    
    func initStyleForContactContainer() {
        
        contactContainer.layer.cornerRadius = 10.0
        contactContainer.clipsToBounds = true
    }
    
    func adjustContactWrapper(lastFrame: CGRect) {
        
        contactWrapper.contentSize.height = lastFrame.origin.y + lastFrame.size.height + 8.0
        contactWrapper.contentInset.top = 20.0
        contactWrapper.contentInset.bottom = 20.0
    }
}
