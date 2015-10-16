//
//  LightSearchController.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/13/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class LightSearchController: UISearchController {

    // The purpose for subclassing UISearchController
    // is to set the statusbar into white color
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
