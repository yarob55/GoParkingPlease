//
//  ParkingAnnotation.swift
//  GoParking
//
//  Created by Ammar AlTahhan on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import MapKit

class ParkingAreaAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}
