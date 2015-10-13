//
//  Contact_Style.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/6/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ContactController {
    
    func adjustContactWrapper(lastFrame: CGRect) {
        
        contactWrapper.contentSize.height = tableView.frame.origin.y + tableView.frame.size.height + 8.0
        contactWrapper.contentInset.top = 20.0
        contactWrapper.contentInset.bottom = 20.0
    }
    
    func stylingTableView() {
        
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
}
