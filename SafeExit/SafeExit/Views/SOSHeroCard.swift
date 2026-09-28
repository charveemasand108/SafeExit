import SwiftUI

struct SOSHeroCard: View {

    let action: () -> Void

    @State private var pulse = false

    var body: some View {

        Button(action: action) {

            ZStack {

                RoundedRectangle(cornerRadius: 30)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.90, green: 0.18, blue: 0.22),
                                Color(red: 0.65, green: 0.05, blue: 0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

                Circle()
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 220, height: 220)
                    .scaleEffect(pulse ? 1.15 : 0.9)
                    .animation(
                        .easeInOut(duration: 1.6)
                        .repeatForever(autoreverses: true),
                        value: pulse
                    )

                VStack(alignment: .leading, spacing: 18) {

                    HStack {

                        VStack(alignment: .leading, spacing: 6) {

                            Text("Emergency SOS")
                                .font(.title.bold())
                                .foregroundStyle(.white)

                            Text("Instantly alert your trusted contacts")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.85))

                        }

                        Spacer()

                        Image(systemName: "shield.fill")
                            .font(.system(size: 34))
                            .foregroundStyle(.white)

                    }

                    Spacer()

                    HStack {

                        Text("HOLD TO ACTIVATE")
                            .font(.caption.bold())
                            .foregroundStyle(.white.opacity(0.9))

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white.opacity(0.9))

                    }

                }
                .padding(24)

            }
            .frame(height: 210)
            .shadow(color: .red.opacity(0.35), radius: 20, y: 10)

        }
        .buttonStyle(.plain)
        .onAppear {
            pulse = true
        }

    }

}

#Preview {

    ZStack {

        GlowBackground()

        SOSHeroCard {

        }
        .padding()

    }

}
