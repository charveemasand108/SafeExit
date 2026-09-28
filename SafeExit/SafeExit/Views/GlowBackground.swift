import SwiftUI

struct GlowBackground: View {

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(red: 13/255, green: 15/255, blue: 36/255),
                    Color(red: 25/255, green: 16/255, blue: 58/255),
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(Color.purple.opacity(0.35))
                .frame(width: 320, height: 320)
                .blur(radius: 120)
                .offset(x: 140, y: -260)

            Circle()
                .fill(Color.red.opacity(0.18))
                .frame(width: 220, height: 220)
                .blur(radius: 100)
                .offset(x: -170, y: 260)

        }
        .ignoresSafeArea()

    }

}

#Preview {
  GlowBackground()
  
}
