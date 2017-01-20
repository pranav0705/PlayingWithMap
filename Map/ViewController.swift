//
//  ViewController.swift
//  Map
//
//  Created by Pranav Bhandari on 1/20/17.
//  Copyright © 2017 Pranav Bhandari. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //functon to set map
        setMap();
        
    }
    func setMap()
    {
        var lat:CLLocationDegrees = 43.095
        var long:CLLocationDegrees = -79.006
        var latDelta:CLLocationDegrees = 0.05
        var longDelta:CLLocationDegrees = 0.05
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: false)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "My Location"
        annotation.subtitle = "My dream place"
        
        map.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer : UIGestureRecognizer) {
        print("Recognized")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

