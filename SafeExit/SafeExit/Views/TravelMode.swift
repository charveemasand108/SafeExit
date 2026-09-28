import SwiftUI

struct TravelModeView: View {

    @StateObject private var viewModel = TravelModeViewModel()

    @State private var destination = ""
    @State private var arrivalTime = Date().addingTimeInterval(3600)

    var body: some View {

        ZStack {

            AnimatedBackground()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    Image(systemName: "car.fill")
                        .font(.system(size: 55))
                        .foregroundStyle(.orange)

                    Text("Travel Mode")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)

                    Text("Stay connected during your journey")
                        .foregroundStyle(.white.opacity(0.7))

                    // MARK: Status

                    GlassCard {

                        VStack(alignment: .leading, spacing: 18) {

                            Label(
                                viewModel.currentTrip == nil ?
                                "No Active Journey" :
                                "Journey in Progress",
                                systemImage: viewModel.currentTrip == nil ?
                                "shield" :
                                "location.fill"
                            )
                            .font(.headline)
                            .foregroundStyle(
                                viewModel.currentTrip == nil ?
                                .gray :
                                .green
                            )

                            Divider()

                            if let trip = viewModel.currentTrip {

                                HStack {

                                    VStack(alignment: .leading) {

                                        Text("Destination")
                                            .foregroundStyle(.secondary)

                                        Text(trip.destination)
                                            .font(.title3.bold())
                                    }

                                    Spacer()

                                    Image(systemName: "mappin.circle.fill")
                                        .font(.system(size: 35))
                                        .foregroundStyle(.red)

                                }

                                Divider()

                                HStack {

                                    VStack(alignment: .leading) {

                                        Text("Expected Arrival")
                                            .foregroundStyle(.secondary)

                                        Text(
                                            trip.expectedArrival,
                                            style: .time
                                        )
                                    }

                                    Spacer()

                                    VStack(alignment: .trailing) {

                                        Text("Remaining")

                                        Text(viewModel.formattedTimeRemaining())
                                            .font(.title2.bold())
                                            .foregroundStyle(.orange)

                                    }

                                }

                            } else {

                                Text("Start a journey to enable live safety tracking.")
                                    .foregroundStyle(.white.opacity(0.8))

                            }

                        }

                    }

                    // MARK: Destination

                    GlassCard {

                        VStack(spacing: 18) {

                            TextField(
                                "Enter Destination",
                                text: $destination
                            )
                            .textFieldStyle(.roundedBorder)

                            DatePicker(
                                "Expected Arrival",
                                selection: $arrivalTime,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .colorScheme(.dark)

                        }

                    }

                    // MARK: Timer

                    if viewModel.currentTrip != nil {

                        GlassCard {

                            VStack(spacing: 18) {

                                Image(systemName: "clock.arrow.circlepath")
                                    .font(.system(size: 55))
                                    .foregroundStyle(.orange)

                                Text(viewModel.formattedTimeRemaining())
                                    .font(.system(size: 42, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)

                                Text("Time Remaining")
                                    .foregroundStyle(.white.opacity(0.7))

                            }
                            .frame(maxWidth: .infinity)

                        }

                    }

                    // MARK: Button

                    Button {

                        withAnimation(.spring()) {

                            if viewModel.currentTrip == nil {

                                guard !destination.isEmpty else { return }

                                viewModel.startTrip(
                                    destination: destination,
                                    arrivalTime: arrivalTime
                                )

                            } else {

                                viewModel.endTrip()

                            }

                        }

                    } label: {

                        Text(
                            viewModel.currentTrip == nil ?
                            "Start Journey" :
                            "End Journey"
                        )
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            viewModel.currentTrip == nil ?
                            Color.green :
                            Color.red
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 18))

                    }

                    Spacer(minLength: 50)

                }
                .padding()

            }

        }
        .navigationTitle("Travel Mode")
        .navigationBarTitleDisplayMode(.inline)
        .alert(
            "Safety Check",
            isPresented: $viewModel.showSafetyCheck
        ) {

            Button("I'm Safe") {
                viewModel.endTrip()
            }

            Button("Need Help", role: .destructive) {
                // Later we'll connect this to the SOS screen
            }

        } message: {

            Text("Your expected arrival time has passed. Are you safe?")

        }

    }

}

#Preview {
    NavigationStack {
        TravelModeView()
    }
}
