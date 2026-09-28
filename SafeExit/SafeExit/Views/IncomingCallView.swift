import SwiftUI
import UIKit

struct IncomingCallView: View {

    let callerName: String

    @Environment(\.dismiss) private var dismiss

    @State private var pulse = false

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color.black,
                    Color(red: 35/255, green: 35/255, blue: 45/255)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {

                Spacer()

                // MARK: Profile Image

                ZStack {

                    Circle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 180, height: 180)

                    Image(systemName: "person.fill")
                        .font(.system(size: 75))
                        .foregroundStyle(.white)

                }
                .scaleEffect(pulse ? 1.12 : 0.95)
                .animation(
                    .easeInOut(duration: 0.8)
                    .repeatForever(autoreverses: true),
                    value: pulse
                )

                Spacer()

                Text(callerName)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.white)

                Text("Incoming Call")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.75))

                Spacer()

                HStack(spacing: 90) {

                    // Decline Button

                    Button {

                        SoundManager.shared.stopRingtone()
                        dismiss()

                    } label: {

                        VStack(spacing: 10) {

                            Circle()
                                .fill(Color.red)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Image(systemName: "phone.down.fill")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                )

                            Text("Decline")
                                .foregroundStyle(.white)

                        }

                    }

                    // Accept Button

                    Button {

                        SoundManager.shared.stopRingtone()
                        dismiss()

                    } label: {

                        VStack(spacing: 10) {

                            Circle()
                                .fill(Color.green)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Image(systemName: "phone.fill")
                                        .font(.title)
                                        .foregroundStyle(.white)
                                )

                            Text("Accept")
                                .foregroundStyle(.white)

                        }

                    }

                }

                Spacer()

            }
            .padding()

        }
        .navigationBarBackButtonHidden(true)
        .onAppear {

            pulse = true

            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)

            SoundManager.shared.playRingtone()

        }
        .onDisappear {

            SoundManager.shared.stopRingtone()

        }

    }

}

#Preview {

    IncomingCallView(callerName: "Mom")

}
