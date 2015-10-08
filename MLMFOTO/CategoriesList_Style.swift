//
//  CategoriesList_Style.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/6/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension CategoriesList {
    
    func initStyling() {
        
        UIView.animateWithDuration(1.0) { () -> Void in
            self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        }
    }
    
    func initStyleForTableView() {
        
        let defaultTopInset = tableView.contentInset.top
        tableView.contentInset.top = 100.0
        tableView.alpha = 0.0
        UIView.animateWithDuration(0.7) { () -> Void in
            self.tableView.contentInset.top = defaultTopInset
            self.tableView.alpha = 1.0
            
        }
    }
}
