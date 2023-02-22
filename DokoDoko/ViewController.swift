//
//  ViewController.swift
//  DokoDoko
//
//  Created by 瀬川太朗 on 2023/02/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = CLLocationManager()
    
    var didStartUpdatingLocation = false
    
    var currentLocation: CLLocation!
    
    var photoInfoArray : [PhotoInfo] = []
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        initLocation()
    }
    
    @IBAction func requestCurrentLocation() {
        self.locationManager.startUpdatingLocation()
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("change authorization")
        switch status {
        case .authorizedWhenInUse:
            print("Authorized")
            didStartUpdatingLocation = true
            locationManager.startUpdatingLocation()
        default:
            print("Not authorized")
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's")
    }
//    private func showPins(){
//        for photoInfo in photoInfoArray {
//            let longtitude = photoInfo.longtitude
//            let latitude = photoInfo.latitude
//
//            guard let longtitude = longtitude as? CLLocationDegrees , let  latitude = latitude as? CLLocationDegrees  else  {return}
//
//            let  annotation = PhotoInfoAnnotation(photoInfo: photoInfo)
//
//            annotation.coordinate = CLLocationCoordinate2DMake (latitude,longtitude)
//
//
//
//
//            mapView.addAnnotation(annotation)
//
//
//
//
//
//        }
//    }
    
    
}
    
     

extension ViewController  {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])  {
        guard let location = locations.first else {return  }
        locationManager.stopUpdatingLocation()
        currentLocation = location
        var region: MKCoordinateRegion = mapView.region
        region.center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        mapView.setRegion(region, animated: true)
    }
    
    
}

