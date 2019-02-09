//
//  BuildingAnnotation.swift
//  GoParkingPlease
//
//  Created by Ammar AlTahhan on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import MapKit

class BuildingAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var building: BuildingSetType!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}
