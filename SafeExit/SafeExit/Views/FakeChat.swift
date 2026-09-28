import SwiftUI

struct FakeChatView: View {

    @State private var senderName = "Best Friend"
    @State private var message = "Hey! Where are you? I'm outside waiting for you."
    @State private var typing = false
    @State private var showMessage = true

    var body: some View {

        ZStack {

            AnimatedBackground()

            VStack(spacing: 20) {

                HStack(spacing: 15) {

                    Circle()
                        .fill(.blue.opacity(0.7))
                        .frame(width: 55,height:55)
                        .overlay(
                            Image(systemName: "person.fill")
                                .foregroundStyle(.white)
                        )

                    VStack(alignment: .leading) {
                        Text(senderName)
                            .font(.title3.bold())
                            .foregroundStyle(.white)

                        HStack(spacing:4){
                            Circle()
                                .fill(.green)
                                .frame(width:8,height:8)
                            Text("Online")
                                .foregroundStyle(.green)
                                .font(.caption)
                        }
                    }

                    Spacer()
                }

                GlassCard {

                    VStack(alignment: .leading, spacing: 18) {

                        if showMessage {

                            HStack {
                                Text(message)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(Color.blue.opacity(0.8))
                                    .clipShape(RoundedRectangle(cornerRadius: 18))

                                Spacer()
                            }

                            Text("10:42 PM")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }

                        if typing {

                            HStack {

                                Text("Typing")
                                    .foregroundStyle(.white.opacity(0.8))

                                ProgressView()

                                Spacer()
                            }

                        }

                    }

                }

                Spacer()

                GlassCard {

                    VStack(spacing:16){

                        TextField("Sender Name", text: $senderName)
                            .textFieldStyle(.roundedBorder)

                        TextField("Message", text: $message)
                            .textFieldStyle(.roundedBorder)

                        Button {

                            showMessage = false
                            typing = true

                            DispatchQueue.main.asyncAfter(deadline: .now()+2){

                                typing = false
                                showMessage = true

                            }

                        } label: {

                            Label("Preview Incoming Message",
                                  systemImage: "message.fill")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth:.infinity)
                                .padding()
                                .background(
                                    LinearGradient(
                                        colors:[.blue,.purple],
                                        startPoint:.leading,
                                        endPoint:.trailing
                                    )
                                )
                                .clipShape(RoundedRectangle(cornerRadius:16))
                        }

                    }

                }

            }
            .padding()

        }
        .navigationTitle("Fake Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        FakeChatView()
    }
}

