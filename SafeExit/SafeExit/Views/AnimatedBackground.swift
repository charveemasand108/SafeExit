import SwiftUI

struct AnimatedBackground: View {

    @State private var animate = false

    var body: some View {

        ZStack {

            // Base Gradient
            LinearGradient(
                colors: [
                    Color(red: 0.04, green: 0.05, blue: 0.12),
                    Color(red: 0.11, green: 0.08, blue: 0.23),
                    Color(red: 0.18, green: 0.09, blue: 0.34)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            // Glow 1
            Circle()
                .fill(Color.purple.opacity(0.45))
                .frame(width: 320, height: 320)
                .blur(radius: 80)
                .offset(
                    x: animate ? -130 : 120,
                    y: animate ? -260 : -180
                )

            // Glow 2
            Circle()
                .fill(Color.blue.opacity(0.30))
                .frame(width: 260, height: 260)
                .blur(radius: 70)
                .offset(
                    x: animate ? 140 : -120,
                    y: animate ? 180 : 280
                )

            // Glow 3
            Circle()
                .fill(Color.pink.opacity(0.28))
                .frame(width: 220, height: 220)
                .blur(radius: 65)
                .offset(
                    x: animate ? 150 : -150,
                    y: animate ? -40 : 120
                )

            // Tiny Stars
            ForEach(0..<25, id: \.self) { index in

                Circle()
                    .fill(Color.white.opacity(0.12))
                    .frame(width: 3, height: 3)
                    .offset(
                        x: CGFloat.random(in: -180...180),
                        y: CGFloat.random(in: -380...380)
                    )

            }

        }
        .onAppear {

            withAnimation(
                .easeInOut(duration: 12)
                .repeatForever(autoreverses: true)
            ) {
                animate.toggle()
            }

        }

    }
}

#Preview {
    AnimatedBackground()
}
