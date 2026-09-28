import SwiftUI

struct TrustedContactsView: View {

    let contacts = [
        "Mom",
        "Dad",
        "Best Friend"
    ]

    var body: some View {

        ZStack {

            AnimatedBackground()

            List {

                ForEach(contacts, id: \.self) { contact in

                    HStack {

                        Image(systemName: "person.crop.circle.fill")
                            .foregroundStyle(.purple)

                        Text(contact)

                    }

                }

            }
            .scrollContentBackground(.hidden)

        }
        .navigationTitle("Trusted Contacts")
    }
}

#Preview {
    NavigationStack {
        TrustedContactsView()
    }
}
