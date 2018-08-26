//
//  MapViewController.swift
//  MapSecure
//
//  Copyright © 2018 DiegoCodes. All rights reserved.
//

import UIKit
import GoogleMaps

class MenuViewController: UIViewController, UISearchBarDelegate{

    @IBOutlet weak var ConceptosBar: UINavigationBar!
    var mapView: GMSMapView?
    
    @IBAction func MenuBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var TitleBar: UINavigationItem!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GMSServices.provideAPIKey("AIzaSyCSidaQnHhF_8w51xShaH06T4dZZj-tZRo")
        let camera = GMSCameraPosition.camera(withLatitude: 37.621262, longitude: -122.378945, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect(x: 30, y: 30, width: 30, height: 30), camera: camera)
        view = mapView
        
        
        
        let currentDirection = CLLocationCoordinate2DMake(37.621262, -122.378945)
        let marker = GMSMarker(position: currentDirection)
        marker.title = "HEllo"
        marker.map = mapView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "buscar", style: .plain, target: self, action: Selector(("search")))
        
       animateBar()
        
        
    }
    func search(){
    
    }
    
    
    func animateBar(){
        ConceptosBar.layer.zPosition = 1
        ConceptosBar.layer.backgroundColor = UIColor.white.cgColor
        ConceptosBar.layer.shadowColor = UIColor.black.cgColor
        ConceptosBar.layer.shadowOffset = CGSize(width: 0, height: 7)
        ConceptosBar.layer.shadowRadius = 4.0
        ConceptosBar.layer.shadowOpacity = 0.1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
