// # Proxy Compiler 18.9.6-f57fd3-20190124

import Foundation
import SAPOData

open class Parking<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = ParkingMetadata.document
    }

    @available(swift, deprecated: 4.0, renamed: "fetchAreaSet")
    open func areaSet(query: DataQuery = DataQuery()) throws -> Array<AreaSetType> {
        return try self.fetchAreaSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchAreaSet")
    open func areaSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<AreaSetType>?, Error?) -> Void) {
        self.fetchAreaSet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchBuildingSet")
    open func buildingSet(query: DataQuery = DataQuery()) throws -> Array<BuildingSetType> {
        return try self.fetchBuildingSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchBuildingSet")
    open func buildingSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<BuildingSetType>?, Error?) -> Void) {
        self.fetchBuildingSet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    open func fetchAreaSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<AreaSetType> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try AreaSetType.array(from: self.executeQuery(var_query.fromDefault(ParkingMetadata.EntitySets.areaSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchAreaSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<AreaSetType>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<AreaSetType> = try self.fetchAreaSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchAreaSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> AreaSetType {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<AreaSetType>.from(self.executeQuery(query.fromDefault(ParkingMetadata.EntitySets.areaSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchAreaSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (AreaSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: AreaSetType = try self.fetchAreaSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchBuildingSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<BuildingSetType> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try BuildingSetType.array(from: self.executeQuery(var_query.fromDefault(ParkingMetadata.EntitySets.buildingSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchBuildingSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<BuildingSetType>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<BuildingSetType> = try self.fetchBuildingSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchBuildingSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> BuildingSetType {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<BuildingSetType>.from(self.executeQuery(query.fromDefault(ParkingMetadata.EntitySets.buildingSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchBuildingSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (BuildingSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: BuildingSetType = try self.fetchBuildingSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchReservationSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<ReservationSetType> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try ReservationSetType.array(from: self.executeQuery(var_query.fromDefault(ParkingMetadata.EntitySets.reservationSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchReservationSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<ReservationSetType>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<ReservationSetType> = try self.fetchReservationSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchReservationSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> ReservationSetType {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<ReservationSetType>.from(self.executeQuery(query.fromDefault(ParkingMetadata.EntitySets.reservationSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchReservationSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (ReservationSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: ReservationSetType = try self.fetchReservationSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchUserSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<UserSetType> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try UserSetType.array(from: self.executeQuery(var_query.fromDefault(ParkingMetadata.EntitySets.userSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchUserSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<UserSetType>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<UserSetType> = try self.fetchUserSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchUserSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> UserSetType {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<UserSetType>.from(self.executeQuery(query.fromDefault(ParkingMetadata.EntitySets.userSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchUserSetType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (UserSetType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: UserSetType = try self.fetchUserSetType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: ParkingMetadataParser.options)
            ParkingMetadataChanges.merge(metadata: self.metadata)
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchReservationSet")
    open func reservationSet(query: DataQuery = DataQuery()) throws -> Array<ReservationSetType> {
        return try self.fetchReservationSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchReservationSet")
    open func reservationSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<ReservationSetType>?, Error?) -> Void) {
        self.fetchReservationSet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchUserSet")
    open func userSet(query: DataQuery = DataQuery()) throws -> Array<UserSetType> {
        return try self.fetchUserSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchUserSet")
    open func userSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<UserSetType>?, Error?) -> Void) {
        self.fetchUserSet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }
}
