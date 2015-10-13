//
//  Contact_TableView.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ContactController: UITableViewDelegate, UITableViewDataSource {
    
    func initTableView(){
        
        loadContactListData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        stylingTableView()
    }
    
    func loadContactListData() {
        
        contactList.append((GLOBAL_VALUES.CONTACT.WHATSAPP.IMAGE, GLOBAL_VALUES.CONTACT.WHATSAPP.TITLE, GLOBAL_VALUES.CONTACT.WHATSAPP.URL))
        contactList.append((GLOBAL_VALUES.CONTACT.BBM.IMAGE, GLOBAL_VALUES.CONTACT.BBM.TITLE, GLOBAL_VALUES.CONTACT.BBM.URL))
        contactList.append((GLOBAL_VALUES.CONTACT.EMAIL.IMAGE, GLOBAL_VALUES.CONTACT.EMAIL.TITLE, GLOBAL_VALUES.CONTACT.EMAIL.URL))
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contactListCell", forIndexPath: indexPath) as! ContactListCell
        
        let (icon, title, url) = contactList[indexPath.row]
        
        cell.imageView?.image = icon
        cell.contactLabel.text = title
        
        if url != nil {
            cell.accessoryType = .DetailButton
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Auto deselecting after table view cell was tapped
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let (_, _, url) = contactList[indexPath.row]
        
        if let openUrl = url {
            if UIApplication.sharedApplication().canOpenURL(openUrl) {
                UIApplication.sharedApplication().openURL(openUrl)
            } else {
                showAlertFromOpenUrl()
            }
        }
    }
}
