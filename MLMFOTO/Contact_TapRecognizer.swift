//
//  Contact_TapRecognizer.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/7/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MapKit
import Contacts

extension ContactController {
    
    func didTapCallView(recognizer: UITapGestureRecognizer) {
        
        showAlertFromCallView()
    }
    
    func didTapDirectionView(recognizer: UITapGestureRecognizer) {
        
        if let annotation = annotation {
            let location = annotation
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            location.mapItem().openInMapsWithLaunchOptions(launchOptions)
        }
    }
}
