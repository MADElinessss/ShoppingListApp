//
//  MapViewController.swift
//  ShoppingListApp
//
//  Created by Madeline on 2024/01/16.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    var latitude: Int = 0
    var longitude: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureMapView(latitude: latitude, longitude: longitude)
    }
    
    func configureMapView(latitude: Int, longitude: Int) {
        let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)

        mapView.setRegion(region, animated: true)
        
        // MKAnnotation: AnnotationView(custom) / MKPointAnnotation: 기본 pin 꼽기
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Here"
        mapView.addAnnotation(annotation)
    }
}

extension MapViewController {
    
}
