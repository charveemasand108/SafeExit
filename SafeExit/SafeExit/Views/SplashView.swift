import SwiftUI

struct SplashView: View {

    @State private var scale = 0.7
    @State private var opacity = 0.0
    @State private var showHome = false

    var body: some View {

        if showHome {

            HomeView()

        } else {

            ZStack 

                AnimatedBackground()
                    .ignoresSafeArea()

                VStack(spacing: 25) {

                    Image(systemName: "shield.checkered")
                        .font(.system(size: 95))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.purple, .pink],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )

                    Text("SafeExit")
                        .font(.system(size: 42, weight: .bold))
                        .foregroundStyle(.white)

                    Text("Your Personal Safety Companion")
                        .foregroundStyle(.white.opacity(0.7))

                }
                .scaleEffect(scale)
                .opacity(opacity)

            }
            .onAppear {

                withAnimation(.easeOut(duration: 1.1)) {

                    scale = 1
                    opacity = 1

                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {

                    withAnimation {

                        showHome = true

                    }

                }

            }

        }

    }

}

#Preview {

    SplashView()

}
