//
//  CategoriesList_NavigationBar.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList {
    
    func initNavigationBar() {
        
        let container = CGRect(origin: CGPointZero, size: CGSize(width: 200.0, height: 33.0))
        let imageLogo = UIImage(named: "Logo")
        let titleView = UIImageView(image: imageLogo)
        
        titleView.contentMode = .Center
        titleView.frame = container
    
        navigationItem.titleView = titleView
        navigationController?.navigationBar.barTintColor = GLOBAL_VALUES.COLOR.PRIMARY_LIGHT
    }
}
