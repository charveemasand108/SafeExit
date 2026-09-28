import SwiftUI

struct GreetingHeader: View {

    private var greeting: String {

        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 5..<12:
            return "Good Morning ☀️"
        case 12..<17:
            return "Good Afternoon 🌤"
        case 17..<21:
            return "Good Evening 🌆"
        default:
            return "Stay Safe 🌙"
        }
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 24) {

            HStack {

                VStack(alignment: .leading, spacing: 6) {

                    Text(greeting)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.75))

                    Text("SafeExit")
                        .font(.system(size: 38, weight: .bold))
                        .foregroundStyle(.white)

                    Text("Your Personal Safety Companion")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))

                }

                Spacer()

                Button {

                } label: {

                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 42))
                        .foregroundStyle(.white.opacity(0.9))

                }

            }

            HStack(spacing: 14) {

                Image(systemName: "checkmark.shield.fill")
                    .font(.title2)
                    .foregroundStyle(.green)

                VStack(alignment: .leading, spacing: 4) {

                    Text("You're Protected")
                        .font(.headline)
                        .foregroundStyle(.white)

                    Text("All safety services are ready")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))

                }

                Spacer()

            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.08))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.12))
            )

        }

    }
}

#Preview {

    ZStack {

        AnimatedBackground()

        GreetingHeader()
            .padding()

    }

}
