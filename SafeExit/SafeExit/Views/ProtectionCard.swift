import SwiftUI

struct ProtectionCard: View {

    var body: some View {

        PrimaryCard {

            HStack {

                VStack(alignment: .leading, spacing: 8) {

                    HStack(spacing: 8) {

                        Circle()
                            .fill(.green)
                            .frame(width: 10, height: 10)

                        Text("You're Protected")
                            .font(.headline)
                            .foregroundStyle(.white)

                    }

                    Text("All systems are active & ready")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.65))

                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.white.opacity(0.5))

            }

        }

    }

}

#Preview {

    ZStack {

        GlowBackground()

        ProtectionCard()
            .padding()

    }

}
