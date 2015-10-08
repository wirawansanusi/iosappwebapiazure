//
//  UIImage.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 9/11/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func imageWithImage(sourceImage: UIImage, scaleToWidth i_width: CGFloat) -> UIImage {
        
        if sourceImage.size.width > i_width {
            let oldWidth = sourceImage.size.width
            let scaleFactor = i_width / oldWidth
            
            let newWidth = oldWidth * scaleFactor
            let newHeight = sourceImage.size.height * scaleFactor
            
            UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
            sourceImage.drawInRect(CGRect(origin: CGPointZero, size: CGSize(width: newWidth, height: newHeight)))
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage
        }
        
        return sourceImage
    }
}