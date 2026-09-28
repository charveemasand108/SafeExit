import SwiftUI

struct TripRecord: Identifiable {

    let id = UUID()
    let destination: String
    let date: String
    let status: String
    let safe: Bool

}

struct HistoryView: View {

    @State private var history = [

        TripRecord(
            destination: "SRM University",
            date: "Today • 5:30 PM",
            status: "Reached Safely",
            safe: true
        ),

        TripRecord(
            destination: "Phoenix Mall",
            date: "Yesterday",
            status: "Journey Completed",
            safe: true
        ),

        TripRecord(
            destination: "Railway Station",
            date: "12 July",
            status: "SOS Activated",
            safe: false
        )

    ]

    var body: some View {

        ZStack {

            AnimatedBackground()
                .ignoresSafeArea()

            ScrollView {

                VStack(spacing: 20) {

                    Text("History")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)

                    ForEach(history) { trip in

                        GlassCard {

                            HStack {

                                Circle()
                                    .fill(
                                        trip.safe ?
                                        Color.green :
                                        Color.red
                                    )
                                    .frame(width: 14,height:14)

                                VStack(alignment: .leading,
                                       spacing: 8) {

                                    Text(trip.destination)
                                        .font(.headline)
                                        .foregroundStyle(.white)

                                    Text(trip.date)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.7))

                                    Text(trip.status)
                                        .foregroundStyle(
                                            trip.safe ?
                                            .green :
                                            .red
                                        )

                                }

                                Spacer()

                                Image(systemName:
                                        trip.safe ?
                                      "checkmark.shield.fill" :
                                      "exclamationmark.triangle.fill")
                                    .font(.title2)
                                    .foregroundStyle(
                                        trip.safe ?
                                        .green :
                                        .red
                                    )

                            }

                        }

                    }

                }
                .padding()

            }

        }
        .navigationTitle("History")
        .navigationBarTitleDisplayMode(.inline)

    }

}

#Preview {

    NavigationStack {

        HistoryView()

    }

}
