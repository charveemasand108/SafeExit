import SwiftUI

struct StatusCard: View {

    @State private var pulse = false

    var body: some View {

        GlassCard {

            VStack(alignment: .leading, spacing: 20) {

                // MARK: Header

                HStack {

                    HStack(spacing: 12) {

                        Circle()
                            .fill(.green)
                            .frame(width: 14, height: 14)
                            .scaleEffect(pulse ? 1.4 : 1.0)
                            .opacity(pulse ? 0.4 : 1)

                        VStack(alignment: .leading, spacing: 4) {

                            Text("You're Protected")
                                .font(.title2.bold())
                                .foregroundStyle(.white)

                            Text("All safety systems are active")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))

                        }

                    }

                    Spacer()

                    Image(systemName: "shield.checkered")
                        .font(.system(size: 32))
                        .foregroundStyle(.green)

                }

                Divider()
                    .overlay(Color.white.opacity(0.15))

                // MARK: Status Items

                VStack(spacing: 16) {

                    StatusRow(
                        icon: "location.fill",
                        title: "Live Location",
                        color: .blue
                    )

                    StatusRow(
                        icon: "person.2.fill",
                        title: "Trusted Contacts",
                        color: .purple
                    )

                    StatusRow(
                        icon: "phone.badge.waveform.fill",
                        title: "Emergency SOS",
                        color: .red
                    )

                    StatusRow(
                        icon: "car.fill",
                        title: "Travel Mode Ready",
                        color: .orange
                    )

                }

            }

        }
        .onAppear {

            withAnimation(
                .easeInOut(duration: 1.2)
                .repeatForever(autoreverses: true)
            ) {

                pulse.toggle()

            }

        }

    }

}

private struct StatusRow: View {

    let icon: String
    let title: String
    let color: Color

    var body: some View {

        HStack {

            ZStack {

                Circle()
                    .fill(color.opacity(0.18))
                    .frame(width: 42, height: 42)

                Image(systemName: icon)
                    .foregroundStyle(color)

            }

            Text(title)
                .foregroundStyle(.white)

            Spacer()

            Label("Active", systemImage: "checkmark.circle.fill")
                .font(.caption.bold())
                .foregroundStyle(.green)

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        StatusCard()
            .padding()

    }

}
