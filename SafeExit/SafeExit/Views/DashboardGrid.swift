import SwiftUI

struct DashboardHeader: View {

    let userName: String

    private var greeting: String {

        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {

        case 5..<12:
            return "Good Morning"

        case 12..<17:
            return "Good Afternoon"

        default:
            return "Good Evening"

        }

    }

    var body: some View {

        HStack(alignment: .center) {

            VStack(alignment: .leading, spacing: 6) {

                Text("\(greeting) 👋")
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.75))

                Text(userName)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)

                Text("Stay Safe Today")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.65))

            }

            Spacer()

            ZStack {

                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [.green, .mint],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 4
                    )
                    .frame(width: 72, height: 72)

                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 64, height: 64)

                Image(systemName: "person.fill")
                    .font(.system(size: 28))
                    .foregroundStyle(.white)

                Circle()
                    .fill(.green)
                    .frame(width: 14, height: 14)
                    .offset(x: 24, y: 24)

            }

        }
        .padding(.horizontal)
        .padding(.top, 10)

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        VStack {

            DashboardHeader(userName: "Charvee")

            Spacer()

        }

    }

}
