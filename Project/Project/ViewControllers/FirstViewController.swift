//
//  FirstViewController.swift
//  Project
//
//  Created by William Cisneros on 01/05/2018.
//  Copyright © 2018 William Cisneros. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {
    var businesses: [Business] = []
    let regionRadius: CLLocationDistance = 1000
    var manager: BusinessManager = BusinessManager.sharedInstance
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let initialLocation = CLLocation(latitude: 44.8404400, longitude: -0.5805000)
        centerMapOnLocation(location: initialLocation)

        updateMap()

        manager.onBusinessesChange = {
            DispatchQueue.main.async {
                self.updateMap()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }

    func updateMap() {
        self.businesses = self.manager.businesses

        let allAnnotations = self.map.annotations
        self.map.removeAnnotations(allAnnotations)

        for business in self.businesses {
            let annotation = Annotation(title: business.name, locationName: business.name, discipline: business.name,
                                        coordinate: CLLocationCoordinate2D(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude))
            self.map.addAnnotation(annotation)
        }
    }
}

