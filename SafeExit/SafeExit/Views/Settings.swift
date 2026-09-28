import SwiftUI

struct SettingsView: View {

    @AppStorage("notificationsEnabled")
    private var notificationsEnabled = true

    @AppStorage("darkMode")
    private var darkMode = true

    var body: some View {

        ZStack {

            AnimatedBackground()
                .ignoresSafeArea()

            List {

                Section("General") {

                    Toggle(
                        "Notifications",
                        isOn: $notificationsEnabled
                    )

                    Toggle(
                        "Dark Mode",
                        isOn: $darkMode
                    )

                }

                Section("About") {

                    VStack(alignment:.leading) {

                        Text("SafeExit")
                            .font(.headline)

                        Text("Version 1.0")
                            .foregroundStyle(.secondary)

                    }

                }

            }
            .scrollContentBackground(.hidden)

        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)

    }

}

#Preview {

    NavigationStack {

        SettingsView()

    }

}
