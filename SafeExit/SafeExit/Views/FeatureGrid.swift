import SwiftUI

struct FeatureGrid: View {

    let fakeCallAction: () -> Void
    let fakeChatAction: () -> Void
    let travelAction: () -> Void
    let locationAction: () -> Void
    let historyAction: () -> Void
    let contactsAction: () -> Void

    private let columns = [
        GridItem(.flexible(), spacing: 18),
        GridItem(.flexible(), spacing: 18)
    ]

    var body: some View {

        LazyVGrid(columns: columns, spacing: 18) {

            FeatureCard(
                title: "Fake Call",
                subtitle: "Trigger a realistic incoming call",
                icon: "phone.fill",
                color: .green
            ) {
                fakeCallAction()
            }

            FeatureCard(
                title: "Fake Chat",
                subtitle: "Open a believable conversation",
                icon: "message.fill",
                color: .blue
            ) {
                fakeChatAction()
            }

            FeatureCard(
                title: "Travel Mode",
                subtitle: "Track your journey safely",
                icon: "car.fill",
                color: .orange
            ) {
                travelAction()
            }

            FeatureCard(
                title: "Live Location",
                subtitle: "View your current location",
                icon: "location.fill",
                color: .purple
            ) {
                locationAction()
            }

            FeatureCard(
                title: "History",
                subtitle: "See previous trips and alerts",
                icon: "clock.arrow.circlepath",
                color: .pink
            ) {
                historyAction()
            }

            FeatureCard(
                title: "Contacts",
                subtitle: "Manage trusted contacts",
                icon: "person.2.fill",
                color: .cyan
            ) {
                contactsAction()
            }

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        ScrollView {

            FeatureGrid(
                fakeCallAction: {},
                fakeChatAction: {},
                travelAction: {},
                locationAction: {},
                historyAction: {},
                contactsAction: {}
            )
            .padding()

        }

    }

}
