import SwiftUI

struct SOSCard: View {

    let action: () -> Void

    @State private var progress: CGFloat = 0
    @State private var timer: Timer?

    var body: some View {

        GlassCard {

            VStack(spacing: 24) {

                HStack {

                    VStack(alignment: .leading) {

                        Text("Emergency SOS")
                            .font(.title.bold())
                            .foregroundStyle(.white)

                        Text("Press and hold for 2 seconds")
                            .foregroundStyle(.white.opacity(0.75))

                    }

                    Spacer()

                    Image(systemName: "shield.lefthalf.filled")
                        .font(.system(size: 34))
                        .foregroundStyle(.red)

                }

                ZStack {

                    Circle()
                        .stroke(Color.white.opacity(0.15), lineWidth: 12)
                        .frame(width: 150,height:150)

                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.red,
                            style: StrokeStyle(
                                lineWidth: 12,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .frame(width:150,height:150)

                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.red,.pink],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width:110,height:110)

                    Text("SOS")
                        .font(.title.bold())
                        .foregroundStyle(.white)

                }
                .gesture(

                    DragGesture(minimumDistance: 0)

                        .onChanged { _ in

                            if timer == nil {

                                startHolding()

                            }

                        }

                        .onEnded { _ in

                            cancelHolding()

                        }

                )

            }

        }

    }

    func startHolding() {

        progress = 0

        timer = Timer.scheduledTimer(withTimeInterval: 0.02,
                                     repeats: true) { t in

            progress += 0.01

            if progress >= 1 {

                t.invalidate()

                timer = nil

                UIImpactFeedbackGenerator(style: .heavy)
                    .impactOccurred()

                action()

            }

        }

    }

    func cancelHolding() {

        timer?.invalidate()

        timer = nil

        withAnimation {

            progress = 0

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        SOSCard {

        }
        .padding()

    }

}
