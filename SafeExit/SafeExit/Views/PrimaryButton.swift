import SwiftUI

struct PrimaryButton: View {

    var title: String

    var icon: String

    var action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: 12) {

                Image(systemName: icon)

                Text(title)
                    .font(.headline)

            }

            .foregroundStyle(.white)

            .frame(maxWidth: .infinity)

            .frame(height: Constants.buttonHeight)

            .background(

                LinearGradient(

                    colors: [.primary, .secondary],

                    startPoint: .leading,

                    endPoint: .trailing

                )

            )

            .clipShape(

                RoundedRectangle(cornerRadius: Constants.cornerRadius)

            )

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        PrimaryButton(
            title: "Get Started",
            icon: "arrow.right"
        ) {

        }
        .padding()

    }

}
