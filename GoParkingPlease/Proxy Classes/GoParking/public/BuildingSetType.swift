// # Proxy Compiler 18.9.6-f57fd3-20190124

import Foundation
import SAPOData

open class BuildingSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = ParkingMetadata.EntityTypes.buildingSetType.property(withName: "id")

    private static var name_: Property = ParkingMetadata.EntityTypes.buildingSetType.property(withName: "name")

    private static var latitude_: Property = ParkingMetadata.EntityTypes.buildingSetType.property(withName: "latitude")

    private static var longitude_: Property = ParkingMetadata.EntityTypes.buildingSetType.property(withName: "longitude")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: ParkingMetadata.EntityTypes.buildingSetType)
    }

    open class func array(from: EntityValueList) -> Array<BuildingSetType> {
        return ArrayConverter.convert(from.toArray(), Array<BuildingSetType>())
    }

    open func copy() -> BuildingSetType {
        return CastRequired<BuildingSetType>.from(self.copyEntity())
    }

    open class var id: Property {
        get {
            objc_sync_enter(BuildingSetType.self)
            defer { objc_sync_exit(BuildingSetType.self) }
            do {
                return BuildingSetType.id_
            }
        }
        set(value) {
            objc_sync_enter(BuildingSetType.self)
            defer { objc_sync_exit(BuildingSetType.self) }
            do {
                BuildingSetType.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BuildingSetType.id))
        }
        set(value) {
            self.setOptionalValue(for: BuildingSetType.id, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: String?) -> EntityKey {
        return EntityKey().with(name: "id", value: StringValue.of(optional: id))
    }

    open class var latitude: Property {
        get {
            objc_sync_enter(BuildingSetType.self)
            defer { objc_sync_exit(BuildingSetType.self) }
            do {
                return BuildingSetType.latitude_
            }
        }
        set(value) {
            objc_sync_enter(BuildingSetType.self)
            defer { objc_sync_exit(BuildingSetType.self) }
            do {
                BuildingSetType.latitude_ = value
            }
        }
    }

    open var latitude: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: BuildingSetType.latitude))
        }
        set(value) {
            self.setOptionalValue(for: BuildingSetType.latitude, to: DoubleValue.of(optional: value))
        }
    }

    open class var longitude: Property {
        get {
            objc_sync_enter(BuildingSetType.self)
            defer { objc_sync_exit(BuildingSetType.self) }
            do {
                return BuildingSetType.longitude_
            }
        }
        set(value) {
            objc_sync_enter(BuildingSetType.self)
            defer { objc_sync_exit(BuildingSetType.self) }
            do {
                BuildingSetType.longitude_ = value
            }
        }
    }

    open var longitude: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: BuildingSetType.longitude))
        }
        set(value) {
            self.setOptionalValue(for: BuildingSetType.longitude, to: DoubleValue.of(optional: value))
        }
    }

    open class var name: Property {
        get {
            objc_sync_enter(BuildingSetType.self)
            defer { objc_sync_exit(BuildingSetType.self) }
            do {
                return BuildingSetType.name_
            }
        }
        set(value) {
            objc_sync_enter(BuildingSetType.self)
            defer { objc_sync_exit(BuildingSetType.self) }
            do {
                BuildingSetType.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: BuildingSetType.name))
        }
        set(value) {
            self.setOptionalValue(for: BuildingSetType.name, to: StringValue.of(optional: value))
        }
    }

    open var old: BuildingSetType {
        return CastRequired<BuildingSetType>.from(self.oldEntity)
    }
}
