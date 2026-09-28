import SwiftUI

struct SafetyTipsCard: View {

    @State private var currentTip = 0

    private let tips = [

        ("location.fill",
         "Always share your live location with a trusted contact when travelling alone."),

        ("phone.fill",
         "Use Fake Call if you ever feel uncomfortable in a public place."),

        ("shield.checkered",
         "Keep your trusted contacts updated for emergencies."),

        ("car.fill",
         "Enable Travel Mode during long journeys.")

    ]

    var body: some View {

        GlassCard {

            VStack(alignment: .leading, spacing: 20) {

                Text("Safety Tip")
                    .font(.title3.bold())
                    .foregroundStyle(.white)

                HStack(alignment: .top, spacing: 16) {

                    Image(systemName: tips[currentTip].0)
                        .font(.system(size: 36))
                        .foregroundStyle(.purple)

                    Text(tips[currentTip].1)
                        .foregroundStyle(.white)

                }

                Button {

                    withAnimation(.easeInOut) {

                        currentTip =
                        (currentTip + 1) % tips.count

                    }

                } label: {

                    Text("Next Tip")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.purple, .pink],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16))

                }

            }

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        SafetyTipsCard()
            .padding()

    }

}
