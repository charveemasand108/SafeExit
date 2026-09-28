import SwiftUI
import Combine

enum AppScreen {
    case splash
    case onboarding
    case home
}

final class AppState: ObservableObject {
    @Published var currentScreen: AppScreen = .splash
}
