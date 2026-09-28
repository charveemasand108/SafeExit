import SwiftUI

struct AppRouter: View {

    @StateObject private var appState = AppState()

    var body: some View {

        switch appState.currentScreen {

        case .splash:
            SplashView()
                .environmentObject(appState)

        case .onboarding:
            OnboardingView()
                .environmentObject(appState)

        case .home:
            HomeView()

        }

    }
}

#Preview {
    AppRouter()
}
