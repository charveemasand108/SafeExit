import SwiftUI

struct FeatureCard: View {

    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let action: () -> Void

    @State private var pressed = false

    var body: some View {

        Button {

            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()

            action()

        } label: {

            VStack(alignment: .leading, spacing: 18) {

                ZStack {

                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    color.opacity(0.85),
                                    color
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 62, height: 62)

                    Image(systemName: icon)
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(.white)

                }

                Spacer()

                VStack(alignment: .leading, spacing: 4) {

                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.white)

                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.65))
                        .lineLimit(2)

                }

            }
            .padding(18)
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .fill(.ultraThinMaterial)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(
                        Color.white.opacity(0.08),
                        lineWidth: 1
                    )
            )
            .shadow(
                color: color.opacity(0.25),
                radius: 18,
                y: 10
            )
            .scaleEffect(pressed ? 0.96 : 1)
            .animation(
                .spring(response: 0.35, dampingFraction: 0.7),
                value: pressed
            )

        }
        .buttonStyle(.plain)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    pressed = true
                }
                .onEnded { _ in
                    pressed = false
                }
        )

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        FeatureCard(
            title: "Fake Call",
            subtitle: "Create an incoming call instantly",
            icon: "phone.fill",
            color: .green
        ) {

        }
        .padding()

    }

}
