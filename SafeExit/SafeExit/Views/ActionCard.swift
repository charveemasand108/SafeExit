import SwiftUI

struct ActionCard: View {

    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let action: () -> Void

    @State private var isPressed = false

    var body: some View {

        Button {

            action()

        } label: {

            VStack(alignment: .leading, spacing: 18) {

                ZStack {

                    Circle()
                        .fill(color.opacity(0.18))
                        .frame(width: 56, height: 56)

                    Image(systemName: icon)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(color)

                }

                Spacer()

                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.65))
                    .lineLimit(2)

            }
            .padding(18)
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white.opacity(0.06))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.white.opacity(0.08))
            )
            .shadow(
                color: color.opacity(0.18),
                radius: 12,
                y: 8
            )
            .scaleEffect(isPressed ? 0.96 : 1)

        }
        .buttonStyle(.plain)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.easeInOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    withAnimation(.spring(response: 0.25)) {
                        isPressed = false
                    }
                }
        )

    }

}

#Preview {

    ZStack {

        GlowBackground()

        ActionCard(
            title: "Fake Call",
            subtitle: "Create an incoming call instantly",
            icon: "phone.fill",
            color: .green
        ) {

        }
        .padding()

    }

}
