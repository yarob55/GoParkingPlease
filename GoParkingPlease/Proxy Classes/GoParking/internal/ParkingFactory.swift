// # Proxy Compiler 18.9.6-f57fd3-20190124

import Foundation
import SAPOData

internal class ParkingFactory {
    static func registerAll() throws {
        ParkingMetadata.EntityTypes.areaSetType.registerFactory(ObjectFactory.with(create: { AreaSetType(withDefaults: false) }, createWithDecoder: { d in try AreaSetType(from: d) }))
        ParkingMetadata.EntityTypes.buildingSetType.registerFactory(ObjectFactory.with(create: { BuildingSetType(withDefaults: false) }, createWithDecoder: { d in try BuildingSetType(from: d) }))
        ParkingMetadata.EntityTypes.reservationSetType.registerFactory(ObjectFactory.with(create: { ReservationSetType(withDefaults: false) }, createWithDecoder: { d in try ReservationSetType(from: d) }))
        ParkingMetadata.EntityTypes.userSetType.registerFactory(ObjectFactory.with(create: { UserSetType(withDefaults: false) }, createWithDecoder: { d in try UserSetType(from: d) }))
        ParkingStaticResolver.resolve()
    }
}
