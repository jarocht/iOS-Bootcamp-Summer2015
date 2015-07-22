//
//  ViewController.swift
//  GoogleMapsDemo
//
//  Created by Jonathan Engelsma on 6/4/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    let locationManager = CLLocationManager()
    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
        var cameraSwitzerland = GMSCameraPosition.cameraWithLatitude(47.5000142,longitude: 8.73299, zoom: 4)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: cameraSwitzerland)
        mapView.settings.compassButton = true
        self.view = mapView
        
        loadLocations()
        
        //PIN FOR EACH LOC
        for loc in locations {
            var marker = GMSMarker()
            
            marker.position = CLLocationCoordinate2DMake(loc.lat, loc.long)
            marker.title = loc.company
            marker.snippet = loc.phone
            marker.appearAnimation = kGMSMarkerAnimationPop
            marker.icon = UIImage(named: "Pin")
            marker.map = mapView
            
        }
        
        mapView.delegate = self
    }
    
    
    func loadLocations(){
        // open and parse a file named data.json dragged into my iOS project
        var filePath = NSBundle.mainBundle().pathForResource("locations", ofType:"json")
        var data = NSData(contentsOfFile:filePath!)
        var parseError: NSError?
        let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!,
            options: NSJSONReadingOptions.AllowFragments,
            error:&parseError)
    
        if let topLevelObj = parsedObject as? NSDictionary {
            if let data = topLevelObj["data"] as? NSArray {
                //var contact: Contact
                var location: Location
                for item in data {
                    var coord = (item[2] as! String)
                    var coordArr = split(coord) {$0 == "," || $0 == " "}
                    location = Location (company: item[0] as! String, phone: item[1] as! String, Latitude: (coordArr[0] as NSString).doubleValue , Longitude: (coordArr[1] as NSString).doubleValue)
                    self.locations.append(location)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateLocation(true)
    }

    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        updateLocation(false)
        updateLocation(true)
    }

    func updateLocation(running: Bool) {
        let mapView = self.view as! GMSMapView
        let status = CLLocationManager.authorizationStatus()
        if running {
            if (CLAuthorizationStatus.AuthorizedWhenInUse == status) {
                locationManager.startUpdatingLocation()
                mapView.myLocationEnabled = true
                mapView.settings.myLocationButton = true
            }
        } else {
            locationManager.stopUpdatingLocation()
            mapView.settings.myLocationButton = false
            mapView.myLocationEnabled = false
        }
        
    }
    
    //Clicked Marker
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        println("You just tapped the \(marker.title) marker!")
        return false
    }
    
    //Override annotation with infoView
    func mapView(mapView: GMSMapView!, markerInfoWindow marker: GMSMarker!) -> UIView! {
        var infoWindow = NSBundle.mainBundle().loadNibNamed("InfoWindow", owner: self, options: nil).first! as! CustomInfoWindow
        infoWindow.TitleLabel.text = marker.title
        infoWindow.SubTitleLabel.text = marker.snippet
        
        return infoWindow
    }
    
    //Clicked annotation (infoView)
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {
        let alertController = UIAlertController(title: marker.title, message:
            marker.snippet, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}

