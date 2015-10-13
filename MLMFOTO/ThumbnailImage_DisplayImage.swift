//
//  ThumbnailImage_DisplayImage.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/12/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit

extension ThumbnailImageController: UIScrollViewDelegate {
    
    func showImageIntoContainer() {
        
        let imageView = UIImageView(image: thumbnailImage)
        imageView.frame = CGRect(origin: CGPointZero, size: thumbnailImage!.size)
        
        thumbnailImageView = imageView
        thumbnailImageContainer.addSubview(thumbnailImageView!)
        thumbnailImageContainer.contentSize = thumbnailImage!.size
        thumbnailImageContainer.delegate = self
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        thumbnailImageContainer.addGestureRecognizer(doubleTapRecognizer)
        
        let scrollViewFrame = thumbnailImageContainer.frame
        
        let scaleWidth = scrollViewFrame.size.width / thumbnailImageContainer.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / thumbnailImageContainer.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        
        thumbnailImageContainer.minimumZoomScale = minScale
        thumbnailImageContainer.maximumZoomScale = 1.0
        thumbnailImageContainer.zoomScale = minScale
        
        centerScrollViewContents()
    }
    
    func centerScrollViewContents() {
        let boundsSize = thumbnailImageContainer.bounds.size
        var contentsFrame = thumbnailImageView!.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        thumbnailImageView!.frame = contentsFrame
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        let size = thumbnailImage!.size
        let bounds = thumbnailImageContainer.bounds.size
        
        if !(size.width < bounds.width && size.height < bounds.height) {
        
            let pointInView = recognizer.locationInView(thumbnailImageView)
            var newZoomScale = thumbnailImageContainer.zoomScale * 1.5
            newZoomScale = min(newZoomScale, thumbnailImageContainer.maximumZoomScale)
        
            let scrollViewSize = thumbnailImageContainer.bounds.size
            let w = scrollViewSize.width / newZoomScale
            let h = scrollViewSize.height / newZoomScale
            let x = pointInView.x - (w / 2.0)
            let y = pointInView.y - (h / 2.0)
        
            let rectToZoomTo = CGRectMake(x, y, w, h)
        
            thumbnailImageContainer.zoomToRect(rectToZoomTo, animated: true)
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return thumbnailImageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }
}
