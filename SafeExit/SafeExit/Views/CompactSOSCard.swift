import SwiftUI

struct CompactSOSCard: View {

    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack {

                VStack(alignment: .leading, spacing: 10) {

                    Text("Emergency SOS")
                        .font(.headline.bold())
                        .foregroundStyle(.white)

                    Text("Tap to send alerts to your trusted contacts")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.8))

                }

                Spacer()

                ZStack {

                    Circle()
                        .fill(.white.opacity(0.18))
                        .frame(width: 72, height: 72)

                    Text("SOS")
                        .font(.headline.bold())
                        .foregroundStyle(.white)

                }

            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0.90, green: 0.20, blue: 0.25),
                        Color(red: 0.72, green: 0.08, blue: 0.16)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 24))

        }
        .buttonStyle(.plain)

    }

}

#Preview {

    ZStack {

        GlowBackground()

        CompactSOSCard {

        }
        .padding()

    }

}
