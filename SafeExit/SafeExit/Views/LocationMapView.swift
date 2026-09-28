import SwiftUI
import MapKit
import CoreLocation

struct LocationMapView: View {

    @ObservedObject private var locationManager = LocationManager.shared

    @State private var cameraPosition: MapCameraPosition = .automatic

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {

                Image(systemName: "location.fill")
                    .foregroundStyle(.blue)

                Text("Live Location")
                    .font(.headline)
                    .foregroundStyle(.white)

                Spacer()

            }

            Map(position: $cameraPosition) {

                UserAnnotation()

            }
            .frame(height: 260)
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .onAppear {

                locationManager.requestPermission()
                locationManager.startUpdatingLocation()

                if let location = locationManager.location {

                    cameraPosition = .region(
                        MKCoordinateRegion(
                            center: location.coordinate,
                            span: MKCoordinateSpan(
                                latitudeDelta: 0.01,
                                longitudeDelta: 0.01
                            )
                        )
                    )

                }

            }
            .onReceive(locationManager.$location) { location in

                guard let location else { return }

                withAnimation(.easeInOut(duration: 0.8)) {

                    cameraPosition = .region(
                        MKCoordinateRegion(
                            center: location.coordinate,
                            span: MKCoordinateSpan(
                                latitudeDelta: 0.01,
                                longitudeDelta: 0.01
                            )
                        )
                    )

                }

            }

            if let location = locationManager.location {

                VStack(alignment: .leading, spacing: 10) {

                    Label(
                        String(format: "%.6f", location.coordinate.latitude),
                        systemImage: "location.north.line.fill"
                    )

                    Label(
                        String(format: "%.6f", location.coordinate.longitude),
                        systemImage: "location.east.line.fill"
                    )

                    Label(
                        "\(Int(location.horizontalAccuracy)) m Accuracy",
                        systemImage: "scope"
                    )

                }
                .font(.caption)
                .foregroundStyle(.white.opacity(0.85))

            } else {

                HStack {

                    ProgressView()

                    Text("Fetching your current location...")
                        .foregroundStyle(.white.opacity(0.8))

                }

            }

        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay {

            RoundedRectangle(cornerRadius: 24)
                .stroke(
                    Color.white.opacity(0.15),
                    lineWidth: 1
                )

        }
        .shadow(color: .black.opacity(0.2), radius: 12)

    }

}

#Preview {

    ZStack {

        Color.black.ignoresSafeArea()

        LocationMapView()
            .padding()

    }

}
