import SwiftUI

enum SafeExitTab: String {
    case home
    case safety
    case history
    case profile

    var icon: String {
        switch self {
        case .home:
            return "house.fill"
        case .safety:
            return "shield.fill"
        case .history:
            return "clock.fill"
        case .profile:
            return "person.fill"
        }
    }

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .safety:
            return "Safety"
        case .history:
            return "History"
        case .profile:
            return "Profile"
        }
    }
}

struct BottomTabBar: View {

    @Binding var selectedTab: SafeExitTab

    var body: some View {

        HStack {

            tab(.home)

            Spacer()

            tab(.safety)

            Spacer()

            tab(.history)

            Spacer()

            tab(.profile)

        }
        .padding(.horizontal, 24)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(Color.white.opacity(0.08))
                )
        )
        .padding(.horizontal)
        .padding(.bottom, 12)

    }

    @ViewBuilder
    func tab(_ tab: SafeExitTab) -> some View {

        Button {

            withAnimation(.spring()) {
                selectedTab = tab
            }

        } label: {

            VStack(spacing: 6) {

                Image(systemName: tab.icon)
                    .font(.title3)

                Text(tab.title)
                    .font(.caption2)

            }
            .foregroundStyle(
                selectedTab == tab
                ? Color.purple
                : Color.white.opacity(0.6)
            )
            .frame(width: 65, height: 55)
            .background(
                selectedTab == tab
                ? Color.white.opacity(0.08)
                : Color.clear
            )
            .clipShape(RoundedRectangle(cornerRadius: 18))

        }
        .buttonStyle(.plain)

    }

}

#Preview {

    ZStack {

        GlowBackground()

        VStack {

            Spacer()

            BottomTabBar(selectedTab: .constant(.home))

        }

    }

}
