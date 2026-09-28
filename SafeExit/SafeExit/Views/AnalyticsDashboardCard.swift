import SwiftUI

struct AnalyticsDashboardCard: View {

    var body: some View {

        GlassCard {

            VStack(alignment: .leading, spacing: 24) {

                HStack {

                    Image(systemName: "chart.bar.fill")
                        .font(.title2)
                        .foregroundStyle(.cyan)

                    Text("Safety Analytics")
                        .font(.title2.bold())
                        .foregroundStyle(.white)

                    Spacer()

                }

                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 16
                ) {

                    DashboardStatCard(
                        icon: "car.fill",
                        color: .green,
                        value: "18",
                        title: "Trips"
                    )

                    DashboardStatCard(
                        icon: "phone.fill",
                        color: .blue,
                        value: "12",
                        title: "Fake Calls"
                    )

                    DashboardStatCard(
                        icon: "message.fill",
                        color: .purple,
                        value: "16",
                        title: "Fake Chats"
                    )

                    DashboardStatCard(
                        icon: "shield.fill",
                        color: .red,
                        value: "0",
                        title: "SOS Alerts"
                    )

                }

                Divider()
                    .overlay(.white.opacity(0.15))

                VStack(alignment: .leading, spacing: 10) {

                    Text("Safety Score")
                        .font(.headline)
                        .foregroundStyle(.white)

                    HStack {

                        Text("96%")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundStyle(.green)

                        Spacer()

                        Image(systemName: "checkmark.shield.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.green)

                    }

                    ProgressView(value: 0.96)
                        .tint(.green)

                }

                Divider()
                    .overlay(.white.opacity(0.15))

                VStack(alignment: .leading, spacing: 8) {

                    Label("Today's Safety Tip",
                          systemImage: "lightbulb.fill")
                        .foregroundStyle(.yellow)

                    Text("Share your live location before beginning a late-night journey.")
                        .foregroundStyle(.white.opacity(0.8))

                }

            }

        }

    }
}

struct DashboardStatCard: View {

    let icon: String
    let color: Color
    let value: String
    let title: String

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
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

#Preview {
    ZStack {
        AnimatedBackground()
        AnalyticsDashboardCard()
            .padding()
    }
}
