import SwiftUI

struct HomeView: View {

    var body: some View {

        AppBackground {

            ScrollView(showsIndicators: false) {

                VStack(alignment: .leading, spacing: 24) {

                    Text("Good Evening")
                        .font(AppFont.largeTitle)
                        .foregroundStyle(.white)

                    Text("Stay safe with SafeExit")
                        .font(AppFont.body)
                        .foregroundStyle(AppColors.secondaryText)

                    StatusPill(
                        title: "Protected",
                        color: AppColors.success
                    )

                    AppleCard {

                        Text("Emergency SOS")
                            .font(AppFont.title)
                            .foregroundStyle(.white)

                        Text("Press only during an emergency.")
                            .foregroundStyle(AppColors.secondaryText)

                        PrimaryButton(
                            title: "Activate SOS",
                            icon: "shield.fill"
                        ) {

                        }

                    }

                }
                .padding(20)
            }

        }

    }
}

#Preview {
    HomeView()
}
