//
//  ProductsList_Main.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

class ProductsList: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryId: Int!
    var products = [[String: AnyObject]]()
    var selectedProduct: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initJSONData()
        initTableView()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        let session = NSURLSession.sharedSession()
        session.getAllTasksWithCompletionHandler { (URLSessions: [NSURLSessionTask]) -> Void in
            for URLSession in URLSessions {
                URLSession.cancel()
            }
        }
    }
}

