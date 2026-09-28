import Foundation
import Combine

final class TravelModeViewModel: ObservableObject {

    @Published var currentTrip: TravelTrip?
    @Published var timeRemaining: TimeInterval = 0

    // MARK: - Safety Check

    @Published var showSafetyCheck = false
    @Published var tripExpired = false

    private let storageKey = "CurrentTravelTrip"
    private var timer: Timer?

    init() {
        loadTrip()
        startTimer()
    }

    deinit {
        timer?.invalidate()
    }

    // MARK: - Start Trip

    func startTrip(destination: String, arrivalTime: Date) {

        let trip = TravelTrip(
            destination: destination,
            expectedArrival: arrivalTime
        )

        currentTrip = trip
        tripExpired = false
        showSafetyCheck = false

        saveTrip()
        updateCountdown()
        startTimer()
    }

    // MARK: - End Trip

    func endTrip() {

        currentTrip = nil
        timeRemaining = 0
        tripExpired = false
        showSafetyCheck = false

        timer?.invalidate()

        UserDefaults.standard.removeObject(forKey: storageKey)
    }

    // MARK: - Timer

    private func startTimer() {

        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateCountdown()
        }
    }

    // MARK: - Countdown

    private func updateCountdown() {

        guard let trip = currentTrip else {
            timeRemaining = 0
            return
        }

        let remaining = trip.expectedArrival.timeIntervalSinceNow

        if remaining <= 0 {

            timeRemaining = 0
            timer?.invalidate()

            if !tripExpired {
                tripExpired = true
                showSafetyCheck = true
            }

        } else {

            timeRemaining = remaining
        }
    }

    // MARK: - Save Trip

    private func saveTrip() {

        guard let trip = currentTrip else { return }

        do {

            let data = try JSONEncoder().encode(trip)

            UserDefaults.standard.set(data, forKey: storageKey)

        } catch {

            print("Failed to save trip:", error)

        }
    }

    // MARK: - Load Trip

    private func loadTrip() {

        guard let data = UserDefaults.standard.data(forKey: storageKey)
        else {
            return
        }

        do {

            currentTrip = try JSONDecoder().decode(
                TravelTrip.self,
                from: data
            )

            updateCountdown()

        } catch {

            print("Failed to load trip:", error)

        }
    }

    // MARK: - Time Formatter

    func formattedTimeRemaining() -> String {

        let totalSeconds = Int(timeRemaining)

        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60

        return String(
            format: "%02d:%02d:%02d",
            hours,
            minutes,
            seconds
        )
    }
}
