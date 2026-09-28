import SwiftUI

struct PrimaryCard<Content: View>: View {

    @ViewBuilder var content: Content

    var body: some View {

        VStack {
            content
        }
        .padding(18)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white.opacity(0.06))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.white.opacity(0.08))
        )
        .shadow(color: .black.opacity(0.35),
                radius: 18,
                y: 10)

    }

}

#Preview {

    ZStack {

        GlowBackground()

        PrimaryCard {

            Text("SafeExit")
                .foregroundStyle(.white)

        }
        .padding()

    }

}
