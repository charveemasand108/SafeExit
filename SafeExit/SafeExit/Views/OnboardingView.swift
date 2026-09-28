import SwiftUI

struct OnboardingView: View {

    @EnvironmentObject var appState: AppState

    @State private var page = 0

    var body: some View {

        ZStack {

            AnimatedBackground()

            TabView(selection: $page) {

                OnboardingCard(
                    image: "shield.checkerboard",
                    title: "Stay Protected",
                    subtitle: "Your personal safety companion."
                )
                .tag(0)

                OnboardingCard(
                    image: "phone.fill",
                    title: "Fake Calls & Chats",
                    subtitle: "Escape uncomfortable situations naturally."
                )
                .tag(1)

                OnboardingCard(
                    image: "location.fill",
                    title: "SOS & Live Location",
                    subtitle: "Share your location instantly."
                )
                .tag(2)

            }

            .tabViewStyle(.page)

            VStack {

                Spacer()

                PrimaryButton(

                    title: page == 2 ? "Get Started" : "Next",

                    icon: "arrow.right"

                ) {

                    if page < 2 {

                        withAnimation {

                            page += 1

                        }

                    }

                    else {

                        appState.currentScreen = .home

                    }

                }

                .padding()

            }

        }

    }

}

#Preview {

    OnboardingView()

        .environmentObject(AppState())

}
