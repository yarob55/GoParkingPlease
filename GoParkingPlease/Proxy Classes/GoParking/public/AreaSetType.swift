// # Proxy Compiler 18.9.6-f57fd3-20190124

import Foundation
import SAPOData

open class AreaSetType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "id")

    private static var name_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "name")

    private static var latitude_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "latitude")

    private static var longitude_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "longitude")

    private static var slots_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "slots")

    private static var isOccupied_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "isOccupied")

    private static var reserved_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "reserved")

    private static var slotsAvailable_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "slotsAvailable")

    private static var radius_: Property = ParkingMetadata.EntityTypes.areaSetType.property(withName: "radius")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: ParkingMetadata.EntityTypes.areaSetType)
    }

    open class func array(from: EntityValueList) -> Array<AreaSetType> {
        return ArrayConverter.convert(from.toArray(), Array<AreaSetType>())
    }

    open func copy() -> AreaSetType {
        return CastRequired<AreaSetType>.from(self.copyEntity())
    }

    open class var id: Property {
        get {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.id_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: AreaSetType.id))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.id, to: StringValue.of(optional: value))
        }
    }

    open class var isOccupied: Property {
        get {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.isOccupied_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.isOccupied_ = value
            }
        }
    }

    open var isOccupied: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: AreaSetType.isOccupied))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.isOccupied, to: IntValue.of(optional: value))
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
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.latitude_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.latitude_ = value
            }
        }
    }

    open var latitude: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: AreaSetType.latitude))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.latitude, to: DoubleValue.of(optional: value))
        }
    }

    open class var longitude: Property {
        get {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.longitude_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.longitude_ = value
            }
        }
    }

    open var longitude: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: AreaSetType.longitude))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.longitude, to: DoubleValue.of(optional: value))
        }
    }

    open class var name: Property {
        get {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.name_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: AreaSetType.name))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.name, to: StringValue.of(optional: value))
        }
    }

    open var old: AreaSetType {
        return CastRequired<AreaSetType>.from(self.oldEntity)
    }

    open class var radius: Property {
        get {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.radius_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.radius_ = value
            }
        }
    }

    open var radius: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: AreaSetType.radius))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.radius, to: IntValue.of(optional: value))
        }
    }

    open class var reserved: Property {
        get {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.reserved_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.reserved_ = value
            }
        }
    }

    open var reserved: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: AreaSetType.reserved))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.reserved, to: IntValue.of(optional: value))
        }
    }

    open class var slots: Property {
        get {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.slots_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.slots_ = value
            }
        }
    }

    open var slots: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: AreaSetType.slots))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.slots, to: IntValue.of(optional: value))
        }
    }

    open class var slotsAvailable: Property {
        get {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                return AreaSetType.slotsAvailable_
            }
        }
        set(value) {
            objc_sync_enter(AreaSetType.self)
            defer { objc_sync_exit(AreaSetType.self) }
            do {
                AreaSetType.slotsAvailable_ = value
            }
        }
    }

    open var slotsAvailable: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: AreaSetType.slotsAvailable))
        }
        set(value) {
            self.setOptionalValue(for: AreaSetType.slotsAvailable, to: IntValue.of(optional: value))
        }
    }
}
