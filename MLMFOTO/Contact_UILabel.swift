//
//  Contact_UILabel.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/7/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MapKit

extension ContactController {
    
    func setLabelInformation() {
        
        titleLabel.text = annotation!.title
        
        let locationString = annotation!.locationName
        let descriptionText = locationString.stringByReplacingOccurrencesOfString(", ", withString: "\n")
        
        let origin = titleLabel.frame.origin
        let size = titleLabel.frame.size
        
        if let label = descriptionLabel {
            label.removeFromSuperview()
        }
        descriptionLabel = UILabel(frame: CGRect(origin: CGPoint(x: origin.x, y: origin.y + size.height + 4.0), size: size))
        descriptionLabel!.text = descriptionText
        descriptionLabel!.textColor = UIColor.grayColor()
        let fontSize = UIFont.systemFontOfSize(14.0)
        descriptionLabel!.font = fontSize
        descriptionLabel!.numberOfLines = 0
        descriptionLabel!.sizeToFit()
        
        self.contactContainer.addSubview(descriptionLabel!)
        
        adjustContactWrapper(descriptionLabel!.frame)
    }
}
