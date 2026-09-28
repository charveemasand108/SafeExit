import SwiftUI

struct AppHeader: View {

    let userName: String

    var body: some View {

        HStack(alignment: .top) {

            VStack(alignment: .leading, spacing: 8) {

                Text("Stay Safe 👋")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.7))

                Text(userName)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)

                Text("Everything is ready to protect you.")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.6))

            }

            Spacer()

            ZStack(alignment: .bottomTrailing) {

                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 64, height: 64)

                Image(systemName: "person.fill")
                    .font(.system(size: 28))
                    .foregroundStyle(.white)

                Circle()
                    .fill(.green)
                    .frame(width: 16, height: 16)
                    .overlay(
                        Circle()
                            .stroke(.black, lineWidth: 2)
                    )

            }

        }
        .padding(.horizontal)

    }

}

#Preview {

    ZStack {

        GlowBackground()

        VStack {

            AppHeader(userName: "Charvee")

            Spacer()

        }
        .padding(.top)

    }

}
