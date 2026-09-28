import SwiftUI

struct GlassCard<Content: View>: View {

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {

        content
            .padding(22)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {

                    RoundedRectangle(cornerRadius: 28)
                        .fill(.ultraThinMaterial)

                    RoundedRectangle(cornerRadius: 28)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.12),
                                    Color.white.opacity(0.03)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )

                    RoundedRectangle(cornerRadius: 28)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.35),
                                    Color.white.opacity(0.05)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                }
            )
            .shadow(
                color: Color.black.opacity(0.25),
                radius: 20,
                x: 0,
                y: 15
            )
    }
}

#Preview {

    ZStack {

        AnimatedBackground()

        GlassCard {

            VStack(alignment: .leading, spacing: 10) {

                Image(systemName: "shield.checkered")
                    .font(.system(size: 42))
                    .foregroundStyle(.green)

                Text("Protected")
                    .font(.title.bold())
                    .foregroundStyle(.white)

                Text("All emergency services are active.")
                    .foregroundStyle(.white.opacity(0.75))

            }

        }
        .padding()

    }

}
