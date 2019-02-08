//
// CollectionType.swift
// GoParkingPlease
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 08/02/19
//

import Foundation

enum CollectionType: String {
    case userSet = "UserSet"
    case buildingSet = "BuildingSet"
    case reservationSet = "ReservationSet"
    case areaSet = "AreaSet"
    case none = ""

    static let all = [
        userSet, buildingSet, reservationSet, areaSet,
    ]
}
