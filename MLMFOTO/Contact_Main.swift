//
//  Contact_Main.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/6/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MapKit

class ContactController: UIViewController {
    
    @IBOutlet weak var contactWrapper: UIScrollView!
    @IBOutlet weak var contactContainer: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var directionView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var annotation: Annotation?
    var descriptionLabel: UILabel?
    var contactList = [(UIImage, String, NSURL?)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        initRecognizer()
        loadMapLocation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setLabelInformation()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        mapView.delegate = nil
    }
}
