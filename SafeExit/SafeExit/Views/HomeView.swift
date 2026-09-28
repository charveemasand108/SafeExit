import SwiftUI

struct HomeView: View {

    @State private var selectedTab: SafeExitTab = .home

    @State private var showFakeCall = false
    @State private var showFakeChat = false
    @State private var showTravel = false
    @State private var showSOS = false
    @State private var showHistory = false
    @State private var showLocation = false

    private let columns = [
        GridItem(.flexible(), spacing: 18),
        GridItem(.flexible(), spacing: 18)
    ]

    var body: some View {

        NavigationStack {

            ZStack(alignment: .bottom) {

                GlowBackground()

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        // MARK: Header

                        AppHeader(userName: "Charvee")

                        // MARK: SOS Card

                        SOSHeroCard {
                            showSOS = true
                        }

                        // MARK: Analytics

                        AnalyticsDashboardCard()

                        // MARK: Protection

                        ProtectionStatusCard()

                        // MARK: Feature Grid

                        LazyVGrid(columns: columns, spacing: 18) {

                            ActionCard(
                                title: "Fake Call",
                                subtitle: "Create an instant incoming call",
                                icon: "phone.fill",
                                color: .green
                            ) {
                                showFakeCall = true
                            }

                            ActionCard(
                                title: "Fake Chat",
                                subtitle: "Receive realistic chat messages",
                                icon: "message.fill",
                                color: .blue
                            ) {
                                showFakeChat = true
                            }

                            ActionCard(
                                title: "Travel Mode",
                                subtitle: "Share your journey safely",
                                icon: "car.fill",
                                color: .orange
                            ) {
                                showTravel = true
                            }

                            ActionCard(
                                title: "Live Location",
                                subtitle: "View your current location",
                                icon: "location.fill",
                                color: .purple
                            ) {
                                showLocation = true
                            }

                        }

                        // MARK: Trusted Contacts

                        PrimaryCard {

                            HStack {

                                VStack(alignment: .leading, spacing: 8) {

                                    Text("Trusted Contacts")
                                        .font(.headline)
                                        .foregroundStyle(.white)

                                    Text("3 Contacts Available")
                                        .foregroundStyle(.white.opacity(0.7))

                                }

                                Spacer()

                                Image(systemName: "person.3.fill")
                                    .font(.title2)
                                    .foregroundStyle(.cyan)

                            }

                        }

                        Spacer()
                            .frame(height: 120)

                    }
                    .padding(.horizontal)
                    .padding(.top, 10)

                }

                BottomTabBar(selectedTab: $selectedTab)

                NavigationLink(
                    destination: FakeCallView(),
                    isActive: $showFakeCall
                ) {
                    EmptyView()
                }

                NavigationLink(
                    destination: FakeChatView(),
                    isActive: $showFakeChat
                ) {
                    EmptyView()
                }

                NavigationLink(
                    destination: TravelModeView(),
                    isActive: $showTravel
                ) {
                    EmptyView()
                }

                NavigationLink(
                    destination: SOSView(),
                    isActive: $showSOS
                ) {
                    EmptyView()
                }

                NavigationLink(
                    destination: HistoryView(),
                    isActive: $showHistory
                ) {
                    EmptyView()
                }

                NavigationLink(
                    destination: LocationMapView(),
                    isActive: $showLocation
                ) {
                    EmptyView()
                }

            }
            .navigationBarHidden(true)

        }

    }
}

#Preview {
    HomeView()
}
