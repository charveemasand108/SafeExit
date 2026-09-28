import SwiftUI

struct OnboardingCard: View {

    let image: String
    let title: String
    let subtitle: String

    var body: some View {

        VStack(spacing: 30) {

            Spacer()

            Image(systemName: image)
                .font(.system(size: 90))
                .foregroundStyle(.white)

            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)

            Text(subtitle)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white.opacity(0.8))
                .padding(.horizontal)

            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()

        OnboardingCard(
            image: "shield.fill",
            title: "SafeExit",
            subtitle: "Stay Safe"
        )
    }
}
