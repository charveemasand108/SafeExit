import SwiftUI

struct TrustedContactsCard: View {

    let contactCount: Int
    let favoriteCount: Int
    let action: () -> Void

    var body: some View {

        Button {

            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()

            action()

        } label: {

            GlassCard {

                VStack(alignment: .leading, spacing: 20) {

                    // MARK: Header

                    HStack {

                        VStack(alignment: .leading, spacing: 6) {

                            Text("Trusted Contacts")
                                .font(.title3.bold())
                                .foregroundStyle(.white)

                            Text("People who'll be notified in emergencies")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))

                        }

                        Spacer()

                        ZStack {

                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [.purple, .pink],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 58, height: 58)

                            Image(systemName: "person.2.fill")
                                .font(.title2)
                                .foregroundStyle(.white)

                        }

                    }

                    // MARK: Stats

                    HStack(spacing: 18) {

                        ContactStatView(
                            value: "\(contactCount)",
                            title: "Contacts"
                        )

                        ContactStatView(
                            value: "\(favoriteCount)",
                            title: "Favorites"
                        )

                    }

                    Divider()
                        .overlay(Color.white.opacity(0.12))

                    // MARK: Footer

                    HStack {

                        Label("Manage Contacts",
                              systemImage: "arrow.right.circle.fill")
                            .foregroundStyle(.white)

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white.opacity(0.6))

                    }

                }

            }

        }
        .buttonStyle(.plain)

    }

}

// MARK: - Contact Stat View

private struct ContactStatView: View {

    let value: String
    let title: String

    var body: some View {

        VStack(alignment: .leading, spacing: 4) {

            Text(value)
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.white)

            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))

        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        TrustedContactsCard(
            contactCount: 5,
            favoriteCount: 2
        ) {

        }
        .padding()

    }

}
