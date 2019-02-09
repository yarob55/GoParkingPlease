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
    @IBOutlet weak var gradientView: DesignableView!
    
    let coreLocation = CLLocationCoordinate2D(latitude: 22.315802, longitude: 39.106159)
    lazy var mapOverview = UIView(frame: mapView.frame)
    
    @IBAction func cancel(_ sender: Any) {
        mapView.register(BuildingMarker.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        smallsmall()
        textField.resignFirstResponder()
        resViewTopConstraint.constant = 500
        setResMode(hidden: true)
        textField.layer.cornerRadius = 8
        self.gradientView.backgroundColor = .clear
        zoomMapViewOut(to: coreLocation.latitude, long: coreLocation.longitude)
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
        let clock = FUIIconLibrary.indicator.clock.withRenderingMode(.alwaysTemplate)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: clock, style: .done, target: self, action: #selector(showLogs))
        
        mapView.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
        resColorImage.tintColor = color
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
    
    class ParkingMarker: FUIMarkerAnnotationView {
        override var annotation: MKAnnotation? {
            willSet {
                markerTintColor = .preferredFioriColor(forStyle: .map1)
                glyphImage = FUIIconLibrary.system.pin.withRenderingMode(.alwaysTemplate)
                displayPriority = .defaultHigh
            }
        }
    }
    
    func loadPins() {
        
        
        
        
        for area in logs {
            if let lat = area.latitude, let long = area.longitude {
                let annoatation = MKPointAnnotation()
                annoatation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                mapView.addAnnotation(annoatation)
            }
        }
    }

    func choose() {
        mapView.register(ParkingMarker.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        mapView.removeAnnotations(mapView.annotations)
        loadPins()
        
    }
    
    func smallsmall() {
        tableViewTopConstraint.constant = 362
        tf_right.constant = 38
        tf_left.constant = 38
        tf_top.constant = 10
        cancelButton.isHidden = true
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
            self.cancelButton.alpha = 0
        }) { (_) in
            self.cancelButton.isHidden = true
        }
    }
    
    func bigbig() {
        tableViewTopConstraint.isActive = false
        tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0)
        tableViewTopConstraint.isActive = true
        
        
        tf_top.constant = 0
        tf_left.constant = 0
        tf_right.constant = 60
        cancelButton.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
            self.cancelButton.alpha = 1
        }
        
        textField.layer.cornerRadius = 0
    }
    
    @objc private func textFieldDidChange(textField: UITextField) {
        let searchText = textField.text!.lowercased()
        filtered = logs.filter({$0.name!.lowercased().prefix(searchText.count) == searchText})
        tableView.reloadData()
    }
    
    func zoomMapViewIn(to lat: Double, long: Double) {
        let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 150, longitudinalMeters: 150)
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
}


extension MapVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bigbig()
        setResMode(hidden: false)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let _ = self.logs[indexPath.row]
            var count: Int = 3, skip: Int!
            if indexPath.row == 0 {
                skip = 0
            } else if indexPath.row == 1 {
                skip = 3
            } else {
                skip = 6
            }
            API.shared.getAreas(count: count, skip: skip, completion: { (areas) in
                DispatchQueue.main.async {
                    self.choose()
                    self.textField.resignFirstResponder()
                    self.setResMode(hidden: false)
                    self.tableViewTopConstraint.isActive = false
                    self.tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: self.resView.topAnchor, constant: 0)
                    self.tableViewTopConstraint.isActive = true
                    self.resViewTopConstraint.constant = -120
                    UIView.animate(withDuration: 0.3) {
                        self.view.layoutIfNeeded()
                    }
                    let areasSorted = areas.sorted(by: { (first, second) -> Bool in
                        return true
                    })
                    if let area = areasSorted.first {
                        let slotsAvailable = area.slotsAvailable!
                        if slotsAvailable <= 5 {
                            self.setResColor(.ourRed)
                        } else if slotsAvailable <= 10 {
                            self.setResColor(.ourYellow)
                        } else {
                            self.setResColor(.ourGreen)
                        }
                        self.gradientView.backgroundColor = .white
                        self.view.layoutIfNeeded()
                        self.zoomMapViewIn(to: area.latitude!, long: area.longitude!)
                    }
                    
                }
            })
    }
    
    
}
