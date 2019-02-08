//
//  API.swift
//  GoParking
//
//  Created by Ammar AlTahhan on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import Foundation
import SAPOData
import SAPFoundation
import SAPCommon


class API {
    
    static let shared = API()
    private var parking: Parking<OnlineODataProvider> {
        return (UIApplication.shared.delegate as! AppDelegate).parking
    }
    
    private init() { }
    
    func getBuildings(completion: @escaping ([BuildingSetType])->Void) {
        
        parking.fetchBuildingSet(completionHandler: { (array, err) in
            guard err == nil else {
                print(err!.localizedDescription)
                NSLog("%s", (err?.localizedDescription)!)
                return
            }
            completion(array!)
        })
        
    }
    
    func getAreas(count: Int, skip: Int, completion: @escaping ([AreaSetType])->Void) {
        let query = DataQuery().selectAll().top(count).skip(skip)
        parking.fetchAreaSet(matching: query, completionHandler: { (array, err) in
            guard err == nil else {
                //print(err?.localizedDescription)
                NSLog("%s", (err?.localizedDescription)!)
                return
            }
            completion(array!)
        })
        
    }
    
    func decreaseSlots(forAreaId id: String, completion: @escaping (Error?)->Void) {
        let query = DataQuery().custom("id", id)
        parking.fetchAreaSetType(matching: query) { [unowned self] (area, err) in
            guard err == nil else { completion(err); return }
            let area = AreaSetType()
            area.id = id
            area.slots = 1
            self.parking.createEntity(area) { (err) in
                completion(err)
            }
        }
    }
    
    
    
}
