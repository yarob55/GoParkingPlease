// # Proxy Compiler 18.9.6-f57fd3-20190124

import Foundation
import SAPOData

internal class ParkingStaticResolver {
    static func resolve() {
        ParkingStaticResolver.resolve1()
    }

    private static func resolve1() {
        Ignore.valueOf_any(ParkingMetadata.EntityTypes.areaSetType)
        Ignore.valueOf_any(ParkingMetadata.EntityTypes.buildingSetType)
        Ignore.valueOf_any(ParkingMetadata.EntityTypes.reservationSetType)
        Ignore.valueOf_any(ParkingMetadata.EntityTypes.userSetType)
        Ignore.valueOf_any(ParkingMetadata.EntitySets.areaSet)
        Ignore.valueOf_any(ParkingMetadata.EntitySets.buildingSet)
        Ignore.valueOf_any(ParkingMetadata.EntitySets.reservationSet)
        Ignore.valueOf_any(ParkingMetadata.EntitySets.userSet)
        Ignore.valueOf_any(AreaSetType.id)
        Ignore.valueOf_any(AreaSetType.name)
        Ignore.valueOf_any(AreaSetType.latitude)
        Ignore.valueOf_any(AreaSetType.longitude)
        Ignore.valueOf_any(AreaSetType.slots)
        Ignore.valueOf_any(AreaSetType.isOccupied)
        Ignore.valueOf_any(AreaSetType.reserved)
        Ignore.valueOf_any(AreaSetType.slotsAvailable)
        Ignore.valueOf_any(AreaSetType.radius)
        Ignore.valueOf_any(BuildingSetType.id)
        Ignore.valueOf_any(BuildingSetType.name)
        Ignore.valueOf_any(BuildingSetType.latitude)
        Ignore.valueOf_any(BuildingSetType.longitude)
        Ignore.valueOf_any(ReservationSetType.lotID)
        Ignore.valueOf_any(ReservationSetType.userID)
        Ignore.valueOf_any(ReservationSetType.startDate)
        Ignore.valueOf_any(ReservationSetType.endDate)
        Ignore.valueOf_any(ReservationSetType.active)
        Ignore.valueOf_any(ReservationSetType.actvie)
        Ignore.valueOf_any(ReservationSetType.lot)
        Ignore.valueOf_any(ReservationSetType.userDetails)
        Ignore.valueOf_any(UserSetType.id)
        Ignore.valueOf_any(UserSetType.username)
        Ignore.valueOf_any(UserSetType.password)
        Ignore.valueOf_any(UserSetType.firstName)
        Ignore.valueOf_any(UserSetType.lastName)
        Ignore.valueOf_any(UserSetType.email)
        Ignore.valueOf_any(UserSetType.joinedAt)
        Ignore.valueOf_any(UserSetType.details)
        Ignore.valueOf_any(UserSetType.departmentID)
        Ignore.valueOf_any(UserSetType.vehicleType)
        Ignore.valueOf_any(UserSetType.seatsAvailable)
        Ignore.valueOf_any(UserSetType.parkingEnabled)
        Ignore.valueOf_any(UserSetType.carpoolEnabled)
        Ignore.valueOf_any(UserSetType.attendanceEnabled)
        Ignore.valueOf_any(UserSetType.active)
        Ignore.valueOf_any(UserSetType.pushNotificationID)
        Ignore.valueOf_any(UserSetType.reservations)
    }
}
