import SwiftUI

struct EmergencyToolkitView: View {

    let fakeCallAction: () -> Void
    let fakeChatAction: () -> Void
    let sosAction: () -> Void
    let travelAction: () -> Void

    var body: some View {

        NavigationStack {

            ZStack {

                AnimatedBackground()
                    .ignoresSafeArea()

                VStack(spacing: 24) {

                    Capsule()
                        .fill(.white.opacity(0.4))
                        .frame(width: 60, height: 6)
                        .padding(.top)

                    Text("Emergency Toolkit")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)

                    Text("Quick access to your most important safety tools.")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.75))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                        spacing: 20
                    ) {

                        ToolkitButton(
                            title: "SOS",
                            subtitle: "Emergency Help",
                            icon: "shield.fill",
                            color: .red,
                            action: sosAction
                        )

                        ToolkitButton(
                            title: "Fake Call",
                            subtitle: "Escape Situation",
                            icon: "phone.fill",
                            color: .green,
                            action: fakeCallAction
                        )

                        ToolkitButton(
                            title: "Fake Chat",
                            subtitle: "Receive Messages",
                            icon: "message.fill",
                            color: .blue,
                            action: fakeChatAction
                        )

                        ToolkitButton(
                            title: "Travel",
                            subtitle: "Safe Journey",
                            icon: "car.fill",
                            color: .orange,
                            action: travelAction
                        )
                    }

                    Spacer()

                }
                .padding()

            }

        }

    }

}

struct ToolkitButton: View {

    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    let action: () -> Void

    @State private var pressed = false

    var body: some View {

        Button {

            action()

        } label: {

            VStack(spacing: 14) {

                Image(systemName: icon)
                    .font(.system(size: 34))
                    .foregroundStyle(.white)

                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.75))

            }
            .frame(maxWidth: .infinity)
            .frame(height: 160)
            .background(
                LinearGradient(
                    colors: [
                        color.opacity(0.9),
                        color.opacity(0.65)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 28))
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(Color.white.opacity(0.15))
            )
            .scaleEffect(pressed ? 0.96 : 1)
            .animation(.spring(response: 0.3), value: pressed)

        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    pressed = true
                }
                .onEnded { _ in
                    pressed = false
                }
        )

    }

}

#Preview {
    EmergencyToolkitView(
        fakeCallAction: {},
        fakeChatAction: {},
        sosAction: {},
        travelAction: {}
    )
}
