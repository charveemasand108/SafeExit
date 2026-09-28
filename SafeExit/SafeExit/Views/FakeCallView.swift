import SwiftUI

struct FakeCallView: View {

    @StateObject private var viewModel = FakeCallViewModel()

    var body: some View {

        ZStack {

            AnimatedBackground()

            ScrollView {

                VStack(spacing: 25) {

                    Text("Fake Call")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)

                    GlassCard {

                        VStack(alignment: .leading, spacing: 15) {

                            Text("Caller Name")
                                .foregroundStyle(.white.opacity(0.8))

                            TextField(
                                "Enter caller name",
                                text: $viewModel.callerName
                            )
                            .textFieldStyle(.roundedBorder)

                        }

                    }

                    GlassCard {

                        VStack(alignment: .leading, spacing: 15) {

                            Text("Select Delay")
                                .foregroundStyle(.white.opacity(0.8))

                            Picker(
                                "Delay",
                                selection: $viewModel.selectedDelay
                            ) {

                                ForEach(viewModel.delays, id: \.self) { delay in

                                    Text("\(delay) sec")
                                        .tag(delay)

                                }

                            }
                            .pickerStyle(.segmented)

                        }

                    }

                    Button {

                        viewModel.startCall()

                    } label: {

                        HStack {

                            Image(systemName: "phone.fill")

                            Text("Start Fake Call")

                        }
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 18)
                        )

                    }

                    Spacer()

                }
                .padding()

            }

        }

        .navigationTitle("Fake Call")
        .navigationBarTitleDisplayMode(.inline)

        .fullScreenCover(
            isPresented: $viewModel.showIncomingCall
        ) {

            IncomingCallView(
                callerName: viewModel.callerName
            )

        }

    }

}

#Preview {

    NavigationStack {

        FakeCallView()

    }

}
