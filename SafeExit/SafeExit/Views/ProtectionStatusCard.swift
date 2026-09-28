import SwiftUI

struct ProtectionStatusCard: View {

    var body: some View {

        GlassCard {

            VStack(alignment: .leading, spacing: 18) {

                Label("Protection Status", systemImage: "shield.checkered")
                    .font(.title2.bold())
                    .foregroundStyle(.white)

                ProtectionStatusItem(
                    icon: "location.fill",
                    title: "Location Services",
                    color: .blue
                )

                ProtectionStatusItem(
                    icon: "person.2.fill",
                    title: "Trusted Contacts",
                    color: .purple
                )

                ProtectionStatusItem(
                    icon: "car.fill",
                    title: "Travel Mode Ready",
                    color: .orange
                )

                ProtectionStatusItem(
                    icon: "phone.badge.waveform.fill",
                    title: "Emergency SOS Ready",
                    color: .red
                )

            }

        }

    }

}

private struct ProtectionStatusItem: View {

    let icon: String
    let title: String
    let color: Color

    var body: some View {

        HStack {

            Image(systemName: icon)
                .foregroundStyle(color)

            Text(title)
                .foregroundStyle(.white)

            Spacer()

            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.green)

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        ProtectionStatusCard()
            .padding()

    }

}
