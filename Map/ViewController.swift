//
//  ViewController.swift
//  Map
//
//  Created by Pranav Bhandari on 1/20/17.
//  Copyright © 2017 Pranav Bhandari. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var SpeedLabel: UILabel!
    @IBOutlet weak var LongitudeLabel: UILabel!
    @IBOutlet weak var LatitudeLabel: UILabel!
    @IBOutlet var map: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //location permission
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        //functon to set map
        setMap();
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        let userLocation : CLLocation = locations[0]
        
        let lat = userLocation.coordinate.latitude
        let long = userLocation.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.05
        let longDelta:CLLocationDegrees = 0.05
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        self.map.setRegion(region, animated: false)
        
        self.LatitudeLabel.text = "\(lat)"
        self.LongitudeLabel.text = "\(long)"
        self.SpeedLabel.text = "\(manager.location?.speed)"
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
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        let newCoordinates:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinates
        annotation.title = "New Place"
        annotation.subtitle = "My dream place 2"
        
        map.addAnnotation(annotation)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

