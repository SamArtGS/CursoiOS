//
//  Mapas.swift
//  iOSInter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/21/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class Mapas: UIViewController,CLLocationManagerDelegate{

    @IBOutlet var Mapita: MKMapView!
    
    @IBOutlet var selector: UISegmentedControl!
    var locationManager: CLLocationManager!
    
    @IBAction func Ubicacion(_ sender: Any) {
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    @IBAction func Seleccion(_ sender: Any) {
        
        switch selector.selectedSegmentIndex {
        case 0:
            Mapita.mapType = .standard
        case 1:
            Mapita.mapType = .satellite
        case 2:
            Mapita.mapType = .hybridFlyover
        default:
            Mapita.mapType = .standard
        }
    }
    @IBAction func Trafico(_ sender: Any) {
        if Mapita.showsTraffic == false{
            Mapita.showsTraffic = true
        }else{
            Mapita.showsTraffic = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.Mapita.setRegion(region, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.blue
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
    }

}
