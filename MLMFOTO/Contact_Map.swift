//
//  Contact_Map.swift
//  MLMFOTO
//
//  Created by wirawan sanusi on 10/6/15.
//  Copyright © 2015 wirawan sanusi. All rights reserved.
//

import UIKit
import MapKit

extension ContactController: MKMapViewDelegate {
    
    func loadMapLocation() {
        let initialLocation = CLLocation(latitude: -6.161152, longitude: 106.833586)
        
        centerMapOnLocation(initialLocation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 200
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.showsUserLocation = false
        addAnnotation()
    }
    
    func addAnnotation() {
        
        let locationAnnotation = Annotation(title: "MLMFOTO",
            locationName: "Metro Atom Plaza Lt.2 Blok BKS no.38-39, Jl. K.H. Samanhudi, Pasar Baru, DKI Jakarta 10710",
            discipline: "Showroom",
            coordinate: CLLocationCoordinate2D(latitude: -6.161152, longitude: 106.833586))
        
        self.annotation = locationAnnotation
        mapView.addAnnotation(locationAnnotation)
        mapView.delegate = self
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? Annotation {
            let identifier = "pin"
            var view: MKAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) {
                dequeuedView.annotation = annotation
                view = dequeuedView
                
            } else {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
            }
            
            view.image = UIImage(named: "Pin")
            view.centerOffset = CGPoint(x: 0, y: -20)
            return view
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            let location = view.annotation as! Annotation
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            location.mapItem().openInMapsWithLaunchOptions(launchOptions)
    }
}
