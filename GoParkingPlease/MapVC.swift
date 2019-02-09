//
//  MapVC.swift
//  GoParking
//
//  Created by Hadi Albinsaad on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import MapKit
import SAPFiori
import SwiftEntryKit

class MapVC: UIViewController {
    
    var logs: [BuildingSetType] = []
    var filtered = [BuildingSetType]()
    @IBOutlet weak var resButton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var tf_right: NSLayoutConstraint!
    @IBOutlet weak var tf_left: NSLayoutConstraint!
    @IBOutlet weak var tf_top: NSLayoutConstraint!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var resViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var resView: UIView!
    @IBOutlet weak var resColorView: UIView!
    @IBOutlet weak var resColorTitle: UILabel!
    @IBOutlet weak var resColorImage: UIImageView!
    @IBOutlet weak var limtedField: UILabel!
    @IBOutlet weak var resNumField: UILabel!
    @IBOutlet weak var messageView: DesignableView!
    @IBOutlet weak var messageViewImage: UIImageView!
    
    let coreLocation = CLLocationCoordinate2D(latitude: 22.309733, longitude: 39.104643)
    lazy var mapOverview = UIView(frame: mapView.frame)
    
    @IBAction func res(_ sender: Any) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.messageView.transform = .identity
        }, completion: nil)
    }
    
    @IBAction func dismissMessageView(_ sender: Any) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.messageView.transform = CGAffineTransform(outside: self.view.bounds, from: .bottom)
        }, completion: nil)
    }
    
    @IBAction func openGoogleMaps(_ sender: Any) {
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!))
        {
            UIApplication.shared.openURL(NSURL(string:
                "comgooglemaps://?saddr=&daddr=\(Float(coreLocation.latitude)),\(Float(coreLocation.latitude))&directionsmode=driving")! as URL)
        } else
        {
            NSLog("Can't use com.google.maps://");
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        mapView.register(BuildingMarker.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        smallsmall()
        textField.resignFirstResponder()
        resViewTopConstraint.constant = 500
        setResMode(hidden: true)
        textField.layer.cornerRadius = 8
        zoomMapViewOut(to: coreLocation.latitude, long: coreLocation.longitude)
        mapView.removeAnnotations(mapView.annotations)
        loadPins()
    }
    
    private func setResMode(hidden: Bool) {
        print("Caallll!")
        resView.isHidden = hidden
        resButton.isHidden = hidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.register(BuildingMarker.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        setupUI()
        fetchData()
        setResMode(hidden: true)
    }
    
    @objc private func showLogs() {
        let vc = Constants.Storyboard.LogsVC.instantiateViewController(withIdentifier: "LogsVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        messageView.transform = CGAffineTransform(outside: view.bounds, from: .bottom)
        
        messageViewImage.image = FUIIconLibrary.system.selected.withRenderingMode(.alwaysTemplate)
        messageViewImage.tintColor = .ourGreen
        let clock = FUIIconLibrary.indicator.clock.withRenderingMode(.alwaysTemplate)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: clock, style: .done, target: self, action: #selector(showLogs))
        
        mapView.register(BuildingMarker.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(ParkingMarkerRed.self, forAnnotationViewWithReuseIdentifier: "red")
        mapView.register(ParkingMarkerYellow.self, forAnnotationViewWithReuseIdentifier: "yellow")
        mapView.register(ParkingMarkerGreen.self, forAnnotationViewWithReuseIdentifier: "green")
        
        mapView.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        smallsmall()
        
        textField.delegate = self
        
        cancelButton.isHidden = true
        
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:16, height:self.textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
     
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .allEditingEvents)
        
        resViewTopConstraint.constant = 1000
        resButton.clipsToBounds = true
        resButton.layer.cornerRadius = 10
        
        let regionRadius: CLLocationDistance = 1200
        
        let coordinateRegion = MKCoordinateRegion(center: coreLocation,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        mapOverview.backgroundColor = .white
        
    }
    
    func setResColor(_ color: UIColor) {
        resButton.backgroundColor = color
        resColorView.backgroundColor = color
        resColorTitle.textColor = color
        let image = resColorImage.image?.withRenderingMode(.alwaysTemplate)
        resColorImage.tintColor = color
        resColorImage.image = image
    }
    
    private func fetchData() {
        
        API.shared.getBuildings { (buildings) in
            self.logs = buildings
            self.tableView.reloadData()
            self.loadPins()
        }
        
    }
    
    class BuildingMarker: FUIMarkerAnnotationView {
        override var annotation: MKAnnotation? {
            willSet {
                markerTintColor = .preferredFioriColor(forStyle: .map1)
                glyphImage = FUIIconLibrary.app.campusOn.withRenderingMode(.alwaysTemplate)
                displayPriority = .defaultHigh
            }
        }
    }
    
    class ParkingMarkerGreen: FUIMarkerAnnotationView {
        override var annotation: MKAnnotation? {
            willSet {
                markerTintColor = UIColor(red: 58/255, green: 131/255, blue: 91/255, alpha: 1)
                glyphImage = FUIIconLibrary.system.pin.withRenderingMode(.alwaysTemplate)
                displayPriority = .defaultHigh
            }
        }
    }
    
    class ParkingMarkerRed: FUIMarkerAnnotationView {
        override var annotation: MKAnnotation? {
            willSet {
                markerTintColor = UIColor(red: 217/255, green: 54/255, blue: 76/255, alpha: 1)
                glyphImage = FUIIconLibrary.system.pin.withRenderingMode(.alwaysTemplate)
                displayPriority = .defaultHigh
            }
        }
    }
    
    class ParkingMarkerYellow: FUIMarkerAnnotationView {
        override var annotation: MKAnnotation? {
            willSet {
                markerTintColor = UIColor(red: 243/255, green: 157/255, blue: 39/255, alpha: 1)
                glyphImage = FUIIconLibrary.system.pin.withRenderingMode(.alwaysTemplate)
                displayPriority = .defaultHigh
            }
        }
    }
    
    func loadPins() {
        
        
        for building in logs {
            if let lat = building.latitude, let long = building.longitude {
                let annoatation = BuildingAnnotation(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                annoatation.building = building
//                annoatation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                mapView.addAnnotation(annoatation)
            }
        }
    }

    func choose() {
        
        
        mapView.removeAnnotations(mapView.annotations)
        loadPins()
        
    }
    
    func smallsmall() {
        tableViewTopConstraint.constant = 300
        tf_right.constant = 28
        tf_left.constant = 28
        tf_top.constant = 10
        cancelButton.isHidden = true
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
            self.cancelButton.alpha = 0
            self.tableView.alpha = 0
        }) { (_) in
            self.cancelButton.isHidden = true
            self.tableView.isHidden = true
        }
    }
    
    
    func big() {
        tf_top.constant = 0
        tf_left.constant = 0
        tf_right.constant = 60
        cancelButton.isHidden = false
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
            self.cancelButton.alpha = 1
            self.textField.layer.cornerRadius = 0
        }
        
    }
    
    
    func bigbig() {

        tableViewTopConstraint.constant = 0
        big()
        tableView.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
            self.tableView.alpha = 1
        }
    }
    
    @objc private func textFieldDidChange(textField: UITextField) {
        let searchText = textField.text!.lowercased()
        filtered = logs.filter({$0.name!.lowercased().prefix(searchText.count) == searchText})
        tableView.reloadData()
    }
    
    func zoomMapViewIn(to lat: Double, long: Double) {
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 250, longitudinalMeters: 250)
        mapView.setRegion(region, animated: true)
    }
    
    func zoomMapViewOut(to lat: Double, long: Double) {
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1200, longitudinalMeters: 1200)
        mapView.setRegion(region, animated: true)
    }

}

extension MapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let defaultId = MKMapViewDefaultAnnotationViewReuseIdentifier
        let id1 = "red"
        let id2 = "green"
        let id3 = "yellow"
        
        if annotation is BuildingAnnotation {
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: defaultId) ?? MKPinAnnotationView(annotation: annotation, reuseIdentifier: defaultId)
            return pinView
        } else if annotation is ParkingAreaAnnotationYello {
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: id3) ?? MKPinAnnotationView(annotation: annotation, reuseIdentifier: id3)
            return pinView
        } else if annotation is ParkingAreaAnnotationRed {
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: id1) ?? MKPinAnnotationView(annotation: annotation, reuseIdentifier: id1)
            return pinView
        } else {
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: id2) ?? MKPinAnnotationView(annotation: annotation, reuseIdentifier: id2)
            return pinView
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let buildannotaion = view.annotation as? BuildingAnnotation {
            for (index, value) in logs.enumerated() {
                if value == buildannotaion.building {
                    selectBuilding(index, tableView)
                }
            }
            
        }
    }
}


extension MapVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bigbig()
        setResMode(hidden: false)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setResMode(hidden: true)
    }
}

extension MapVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (textField.text!.isEmpty) ? logs.count : filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = (textField.text!.isEmpty) ? logs[indexPath.row].name! : filtered[indexPath.row].name!
        return cell
    }
    
    fileprivate func selectBuilding(_ index: Int, _ tableView: UITableView) {
        big()
        var count: Int = 3, skip: Int!
        if index == 0 {
            skip = 0
        } else if index == 1 {
            skip = 3
        } else {
            skip = 6
        }
        API.shared.getAreas(count: count, skip: skip, completion: { (areas) in
            DispatchQueue.main.async {
                self.choose()
                self.textField.resignFirstResponder()
                self.setResMode(hidden: false)
//                self.tableViewTopConstraint.isActive = false
//                self.tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: self.resView.topAnchor, constant: 0)
//                self.tableViewTopConstraint.isActive = true
                self.resViewTopConstraint.constant = -120
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
                let areasSorted = areas.sorted(by: { (first, second) -> Bool in
                    return true
                })
                if let area = areasSorted.first {
                    let slotsAvailable = area.slotsAvailable!
                    var annotation: MKAnnotation!
                    if slotsAvailable <= 5 {
                        self.setResColor(.ourRed)
                        self.limtedField.text = "Jammed"
                        annotation = ParkingAreaAnnotationRed(coordinate: CLLocationCoordinate2D(latitude: area.latitude!, longitude: area.longitude!))
                    } else if slotsAvailable <= 10 {
                        self.setResColor(.ourYellow)
                        self.limtedField.text = "Limted"
                        annotation = ParkingAreaAnnotationYello(coordinate: CLLocationCoordinate2D(latitude: area.latitude!, longitude: area.longitude!))
                    } else {
                        self.setResColor(.ourGreen)
                        self.limtedField.text = "Available"
                        annotation = ParkingAreaAnnotationGreen(coordinate: CLLocationCoordinate2D(latitude: area.latitude!, longitude: area.longitude!))
                    }
                    self.view.layoutIfNeeded()
                    self.zoomMapViewIn(to: area.latitude!, long: area.longitude!)
                    
                    self.mapView.addAnnotation(annotation)
                    self.resColorTitle.text = area.name
                    self.resNumField.text = "\(slotsAvailable) empty slots"
                }
                self.tableViewTopConstraint.constant = 300
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.layoutIfNeeded()
                    self.tableView.alpha = 0
                }) { (_) in
                    self.tableView.isHidden = true
                }
                
            }
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//            let _ = self.logs[indexPath.row]
//            var count: Int = 3, skip: Int!
//            if indexPath.row == 0 {
//                skip = 0
//            } else if indexPath.row == 1 {
//                skip = 3
//            } else {
//                skip = 6
//            }
            selectBuilding(indexPath.row, tableView)
        
    }
    
    
}
