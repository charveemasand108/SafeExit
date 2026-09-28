import Foundation
import CoreLocation
import Combine

final class LocationManager: NSObject, ObservableObject {

    // MARK: - Singleton

    static let shared = LocationManager()

    // MARK: - Published Properties

    @Published var location: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var isLocationEnabled = false

    // MARK: - Private Properties

    private let manager = CLLocationManager()

    // MARK: - Initializer

    private override init() {
        super.init()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 5
        manager.pausesLocationUpdatesAutomatically = false

        authorizationStatus = manager.authorizationStatus
    }

    // MARK: - Permission

    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }

    // MARK: - Start Tracking

    func startUpdatingLocation() {

        guard CLLocationManager.locationServicesEnabled() else {
            print("Location Services are disabled.")
            isLocationEnabled = false
            return
        }

        isLocationEnabled = true

        switch manager.authorizationStatus {

        case .authorizedAlways,
             .authorizedWhenInUse:

            manager.startUpdatingLocation()

        case .notDetermined:

            requestPermission()

        case .restricted,
             .denied:

            print("Location permission denied.")

        @unknown default:
            break
        }
    }

    // MARK: - Stop Tracking

    func stopUpdatingLocation() {
        manager.stopUpdatingLocation()
    }

    // MARK: - Last Known Location

    func getCurrentLocation() -> CLLocation? {
        location
    }
}

// MARK: - CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        DispatchQueue.main.async {
            self.authorizationStatus = manager.authorizationStatus
        }

        switch manager.authorizationStatus {

        case .authorizedAlways,
             .authorizedWhenInUse:

            manager.startUpdatingLocation()

        case .restricted,
             .denied:

            print("Location permission denied.")

        case .notDetermined:
            break

        @unknown default:
            break
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {

        guard let latestLocation = locations.last else {
            return
        }

        DispatchQueue.main.async {
            self.location = latestLocation
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {

        print("Failed to get location: \(error.localizedDescription)")
    }
}
