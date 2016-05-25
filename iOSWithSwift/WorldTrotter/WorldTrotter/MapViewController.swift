//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Mia on 5/19/16.
//  Copyright © 2016 Mia. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var mapView: MKMapView!
    
    var bornPin: MKPinAnnotationView!
    var curPin: MKPinAnnotationView!
    var pastPin: MKPinAnnotationView!
    
    let locationManager = CLLocationManager()
    
    let homeLocation = CLLocationCoordinate2DMake(40.01540192, 20.87901079)
    let pastLocation = CLLocationCoordinate2DMake(80.01540192, 60.87901079)
    
    let homeAnnotation = MKPointAnnotation()
    
    var start: Int = 0
    
    // MARK: - Life Cycle
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        mapView.delegate = self
        
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
//        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        
        let topContraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant:8)
        let leadingContraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingContraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        topContraint.active = true
        leadingContraint.active = true
        trailingContraint.active = true
        
        // action
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), forControlEvents:.ValueChanged)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("ConversionViewController loaded its view.")
        
        // Siver: User's Location -- Chapter 6
        userLocationConfigurations()
        
        // Cold: Dropping Pins -- Chapter 7
        pinsConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    // MARK: - Others
    
    func userLocationConfigurations() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        let userTrackerBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))

        view.addSubview(userTrackerBtn)
        userTrackerBtn.setTitle("Tracker", forState: .Normal)
        userTrackerBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)

        userTrackerBtn.addTarget(self, action: #selector(userTrackerStart(_:)), forControlEvents: .TouchUpInside)
        
        userTrackerBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingCons = userTrackerBtn.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 15)
        let bottomCons = userTrackerBtn.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -15)
        leadingCons.active = true
        bottomCons.active = true
        
        /*
         // method with MKUserTrackingBarButtonItem
        let toolBar = UIToolbar()
        
        view.addSubview(toolBar)

        toolBar.setBackgroundImage(UIImage(),
                                        forToolbarPosition: UIBarPosition.Any,
                                        barMetrics: UIBarMetrics.Default)
        toolBar.setShadowImage(UIImage(),
                                    forToolbarPosition: UIBarPosition.Any)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstrain = toolBar.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let bottomConstrain = toolBar.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor)
        let trailingConstrain = toolBar.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        leadingConstrain.active = true
        bottomConstrain.active = true
        trailingConstrain.active = true
        
        let userTracker = MKUserTrackingBarButtonItem(mapView: mapView)
        
        toolBar.setItems([userTracker], animated: true)
         */
    }
    
    func userTrackerStart(button: UIButton) {
        mapView.showsUserLocation = !mapView.showsUserLocation
        mapView.setUserTrackingMode(.Follow, animated: true)
    }
    
    func pinsTrackerGoThrough(button: UIButton) {
        
        start += 1
        start = start % mapView.annotations.count;
        let location = mapView.annotations[start].coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        
        
        
        mapView.region = region
        mapView.regionThatFits(region)
        
    }
    
    func pinsConfiguration() {
        
        homeAnnotation.coordinate = homeLocation
        homeAnnotation.title = "Home"
        
        let pastAnnotation = MKPointAnnotation()
        pastAnnotation.coordinate = pastLocation
        pastAnnotation.title = "Past Place"
        
        mapView.addAnnotations([homeAnnotation, pastAnnotation])
        
        let pinsBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        view.addSubview(pinsBtn)
        pinsBtn.setTitle("Pins", forState: .Normal)
        pinsBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        pinsBtn.addTarget(self, action: #selector(pinsTrackerGoThrough(_:)), forControlEvents: .TouchUpInside)
        
        pinsBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingCons = pinsBtn.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -15)
        let bottomCons = pinsBtn.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -15)
        trailingCons.active = true
        bottomCons.active = true
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            //return nil so map view draws "blue dot" for standard user location
//            return nil
//        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinTintColor = UIColor.purpleColor()

        } else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    func mapViewDidStopLocatingUser(mapView: MKMapView) {
        print(#function)
        let curAnnotation = MKPointAnnotation()
        curAnnotation.coordinate = mapView.userLocation.coordinate
        curAnnotation.title = "Current Location"
        
        mapView.addAnnotation(curAnnotation)
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
}
