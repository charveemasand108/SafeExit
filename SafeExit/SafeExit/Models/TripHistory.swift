import Foundation

struct TripHistory: Identifiable, Codable {

    let id: UUID

    let destination: String
    let startTime: Date
    let endTime: Date
    let wasSafe: Bool

    init(
        id: UUID = UUID(),
        destination: String,
        startTime: Date,
        endTime: Date,
        wasSafe: Bool
    ) {
        self.id = id
        self.destination = destination
        self.startTime = startTime
        self.endTime = endTime
        self.wasSafe = wasSafe
    }

}
