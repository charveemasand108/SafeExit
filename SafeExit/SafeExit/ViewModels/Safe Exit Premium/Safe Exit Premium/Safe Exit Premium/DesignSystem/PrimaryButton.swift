import SwiftUI

struct PrimaryButton: View {

    let title: String
    let icon: String
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: 12) {

                Image(systemName: icon)

                Text(title)
                    .fontWeight(.semibold)

                Spacer()
            }
            .padding()
            .foregroundStyle(.white)
            .background(AppColors.accent)
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }
}
