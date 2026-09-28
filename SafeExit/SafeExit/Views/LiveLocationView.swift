import SwiftUI
import MapKit

struct LiveLocationView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 13.0827,
            longitude: 80.2707
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.02,
            longitudeDelta: 0.02
        )
    )

    var body: some View {

        ZStack {

            GlowBackground()

            VStack(spacing: 20) {

                Text("Live Location")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                Map(coordinateRegion: $region)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .frame(height: 450)

                Button("Stop Sharing") {

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.purple)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))

            }
            .padding()

        }
        .navigationBarTitleDisplayMode(.inline)

    }

}

#Preview {
    LiveLocationView()
}
