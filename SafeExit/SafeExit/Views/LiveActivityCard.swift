import SwiftUI

struct LiveActivityCard: View {

    @State private var isTraveling = false

    var body: some View {

        GlassCard {

            VStack(alignment: .leading, spacing: 18) {

                HStack {

                    Text("Live Activity")
                        .font(.title3.bold())
                        .foregroundStyle(.white)

                    Spacer()

                    Circle()
                        .fill(isTraveling ? .green : .gray)
                        .frame(width: 12, height: 12)

                }

                if isTraveling {

                    VStack(alignment: .leading, spacing: 8) {

                        Label("Travel Mode Active", systemImage: "car.fill")

                        Label("Destination: Phoenix Mall", systemImage: "mappin.and.ellipse")

                        Label("ETA: 18 min", systemImage: "clock")

                    }
                    .foregroundStyle(.white)

                    ProgressView(value: 0.65)
                        .tint(.green)

                } else {

                    VStack(alignment: .leading, spacing: 8) {

                        Label("No Active Journey", systemImage: "checkmark.shield.fill")

                        Text("Start Travel Mode before heading out.")
                            .foregroundStyle(.white.opacity(0.75))

                    }
                    .foregroundStyle(.white)

                }

                Button {

                    withAnimation(.spring()) {
                        isTraveling.toggle()
                    }

                } label: {

                    Text(isTraveling ? "End Journey" : "Start Demo Journey")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.green)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))

                }

            }

        }

    }

}

#Preview {
    ZStack {
        AnimatedBackground()
        LiveActivityCard()
            .padding()
    }
}
