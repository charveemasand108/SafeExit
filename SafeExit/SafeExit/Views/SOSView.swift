import SwiftUI

struct SOSView: View {
    var body: some View {
        ZStack {
            AnimatedBackground()

            VStack(spacing: 24) {
                Image(systemName: "shield.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(.red)

                Text("Emergency SOS")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                Text("Temporary recovery version.\nWe'll add the premium UI after your project builds.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white.opacity(0.8))

                NavigationLink("Open Live Location") {
                    LocationMapView()
                }
                .buttonStyle(.borderedProminent)

                Button("Play Siren") {
                    SOSSoundManager.shared.playSiren()
                }

                Button("Stop Siren") {
                    SOSSoundManager.shared.stopSiren()
                }
                .tint(.red)
            }
            .padding()
        }
        .navigationTitle("SOS")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            SOSSoundManager.shared.stopSiren()
        }
    }
}

#Preview {
    NavigationStack {
        SOSView()
    }
}

