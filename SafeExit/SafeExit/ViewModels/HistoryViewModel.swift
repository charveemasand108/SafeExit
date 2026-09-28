import Foundation
import Combine

final class HistoryViewModel: ObservableObject {

    @Published var trips: [TripHistory] = []

    private let storageKey = "TripHistory"

    init() {
        loadTrips()
    }

    // MARK: - Add Trip

    func addTrip(_ trip: TripHistory) {

        trips.insert(trip, at: 0)
        saveTrips()

    }

    // MARK: - Delete Trip

    func deleteTrips(at offsets: IndexSet) {

        for index in offsets.sorted(by: >) {
            trips.remove(at: index)
        }

        saveTrips()

    }

    // MARK: - Save Trips

    private func saveTrips() {

        do {

            let data = try JSONEncoder().encode(trips)

            UserDefaults.standard.set(
                data,
                forKey: storageKey
            )

        } catch {

            print("Failed to save history:", error)

        }

    }

    // MARK: - Load Trips

    private func loadTrips() {

        guard let data = UserDefaults.standard.data(forKey: storageKey)
        else {
            return
        }

        do {

            trips = try JSONDecoder().decode(
                [TripHistory].self,
                from: data
            )

        } catch {

            print("Failed to load history:", error)

        }

    }

}
