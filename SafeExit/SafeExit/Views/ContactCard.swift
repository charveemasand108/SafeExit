import SwiftUI

struct ContactCard: View {

    let contact: TrustedContact
    let onFavorite: () -> Void
    let onDelete: () -> Void

    var body: some View {

        HStack(spacing: 16) {

            Circle()
                .fill(
                    LinearGradient(
                        colors: [.pink, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                )

            VStack(alignment: .leading, spacing: 6) {

                Text(contact.name)
                    .font(.headline)

                Text(contact.phoneNumber)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

            }

            Spacer()

            Button(action: onFavorite) {

                Image(systemName: contact.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .font(.title3)

            }

            Button(action: onDelete) {

                Image(systemName: "trash.fill")
                    .foregroundColor(.red)
                    .font(.title3)

            }

        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(radius: 8)

    }
}

#Preview {
    ContactCard(
        contact: TrustedContact(
            name: "Mom",
            phoneNumber: "+91 9876543210",
            isFavorite: true
        ),
        onFavorite: {},
        onDelete: {}
    )
    .padding()
}
