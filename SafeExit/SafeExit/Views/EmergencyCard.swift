import SwiftUI

struct EmergencyCard: View {

    var body: some View {

        NavigationLink {

            SOSView()

        } label: {

            HStack(spacing: 20) {

                ZStack {

                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 70, height: 70)

                    Image(systemName: "shield.lefthalf.filled")
                        .font(.system(size: 32))
                        .foregroundStyle(.white)

                }

                VStack(alignment: .leading, spacing: 6) {

                    Text("Emergency SOS")
                        .font(.title2.bold())
                        .foregroundStyle(.white)

                    Text("Tap to activate emergency assistance")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))

                }

                Spacer()

                Image(systemName: "chevron.right.circle.fill")
                    .font(.system(size: 30))
                    .foregroundStyle(.white.opacity(0.9))

            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .background(
                LinearGradient(
                    colors: [
                        Color.red,
                        Color(red: 0.75, green: 0.05, blue: 0.15)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .shadow(color: .red.opacity(0.45), radius: 18, y: 10)

        }
        .buttonStyle(.plain)

    }
}

#Preview {
    NavigationStack {
        ZStack {
            AnimatedBackground()
            EmergencyCard()
                .padding()
        }
    }
}
