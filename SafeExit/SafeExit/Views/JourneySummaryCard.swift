import SwiftUI

struct JourneySummaryCard: View {

    let destination: String
    let duration: String
    let distance: String

    var body: some View {

        GlassCard {

            VStack(alignment: .leading, spacing: 16) {

                HStack {

                    Image(systemName: "checkmark.shield.fill")
                        .font(.title2)
                        .foregroundStyle(.green)

                    Text("Last Journey")
                        .font(.title3.bold())
                        .foregroundStyle(.white)

                    Spacer()

                }

                Divider()

                InfoRow(
                    icon: "mappin.and.ellipse",
                    title: "Destination",
                    value: destination
                )

                InfoRow(
                    icon: "clock.fill",
                    title: "Duration",
                    value: duration
                )

                InfoRow(
                    icon: "road.lanes",
                    title: "Distance",
                    value: distance
                )

                HStack {

                    Spacer()

                    Label("Arrived Safely", systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.green)

                }

            }

        }

    }

}

private struct InfoRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {

        HStack {

            Image(systemName: icon)
                .foregroundStyle(.white)

            Text(title)
                .foregroundStyle(.white.opacity(0.8))

            Spacer()

            Text(value)
                .foregroundStyle(.white)
                .bold()

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        JourneySummaryCard(
            destination: "Phoenix Mall",
            duration: "24 min",
            distance: "8.4 km"
        )
        .padding()

    }

}
