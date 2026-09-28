import SwiftUI

struct SafetyStatsCard: View {

    let trips: Int
    let contacts: Int
    let sosCount: Int

    var body: some View {

        GlassCard {

            VStack(alignment: .leading, spacing: 20) {

                Text("Safety Dashboard")
                    .font(.title3.bold())
                    .foregroundStyle(.white)

                HStack {

                    StatItem(
                        icon: "car.fill",
                        value: "\(trips)",
                        title: "Trips",
                        color: .green
                    )

                    Spacer()

                    StatItem(
                        icon: "person.2.fill",
                        value: "\(contacts)",
                        title: "Contacts",
                        color: .purple
                    )

                    Spacer()

                    StatItem(
                        icon: "shield.lefthalf.filled",
                        value: "\(sosCount)",
                        title: "SOS",
                        color: .red
                    )

                }

            }

        }

    }

}

private struct StatItem: View {

    let icon: String
    let value: String
    let title: String
    let color: Color

    var body: some View {

        VStack(spacing: 10) {

            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)

            Text(value)
                .font(.title.bold())
                .foregroundStyle(.white)

            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        SafetyStatsCard(
            trips: 18,
            contacts: 4,
            sosCount: 0
        )
        .padding()

    }

}
