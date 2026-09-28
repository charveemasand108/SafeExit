import SwiftUI

struct SafetyBanner: View {

    @State private var animate = false

    var body: some View {

        HStack(spacing: 15) {

            Circle()
                .fill(.green)
                .frame(width: 14, height: 14)
                .scaleEffect(animate ? 1.4 : 1)
                .opacity(animate ? 0.4 : 1)

            VStack(alignment: .leading, spacing: 5) {

                Text("All Systems Active")
                    .font(.headline)
                    .foregroundStyle(.white)

                Text("Location • SOS • Travel Mode Ready")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))

            }

            Spacer()

            Image(systemName: "checkmark.shield.fill")
                .font(.title2)
                .foregroundStyle(.green)

        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white.opacity(0.08))
        )
        .onAppear {

            withAnimation(
                .easeInOut(duration: 1)
                .repeatForever(autoreverses: true)
            ) {

                animate.toggle()

            }

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        SafetyBanner()
            .padding()

    }

}
