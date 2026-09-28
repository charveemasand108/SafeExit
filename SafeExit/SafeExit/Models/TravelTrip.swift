import Foundation

struct TravelTrip: Identifiable, Codable {

    let id: UUID

    var destination: String
    var startTime: Date
    var expectedArrival: Date
    var isActive: Bool

    init(
        id: UUID = UUID(),
        destination: String,
        startTime: Date = Date(),
        expectedArrival: Date,
        isActive: Bool = true
    ) {
        self.id = id
        self.destination = destination
        self.startTime = startTime
        self.expectedArrival = expectedArrival
        self.isActive = isActive
    }

}
