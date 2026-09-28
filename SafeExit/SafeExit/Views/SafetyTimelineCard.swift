import SwiftUI

struct TimelineEvent: Identifiable {

    let id = UUID()
    let icon: String
    let title: String
    let subtitle: String
    let color: Color

}

struct SafetyTimelineCard: View {

    let events: [TimelineEvent] = [

        TimelineEvent(
            icon: "location.fill",
            title: "Travel Started",
            subtitle: "7:05 PM",
            color: .blue
        ),

        TimelineEvent(
            icon: "person.2.fill",
            title: "Location Shared",
            subtitle: "Trusted Contacts",
            color: .green
        ),

        TimelineEvent(
            icon: "checkmark.shield.fill",
            title: "Arrived Safely",
            subtitle: "7:38 PM",
            color: .green
        )

    ]

    var body: some View {

        GlassCard {

            VStack(alignment: .leading, spacing: 20) {

                Text("Today's Activity")
                    .font(.title3.bold())
                    .foregroundStyle(.white)

                ForEach(events) { event in

                    HStack(alignment: .top, spacing: 16) {

                        Circle()
                            .fill(event.color)
                            .frame(width: 12, height: 12)
                            .padding(.top, 6)

                        VStack(alignment: .leading, spacing: 6) {

                            Label(event.title,
                                  systemImage: event.icon)
                                .foregroundStyle(.white)

                            Text(event.subtitle)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.65))

                        }

                        Spacer()

                    }

                }

            }

        }

    }

}

#Preview {

    ZStack {

        AnimatedBackground()

        SafetyTimelineCard()
            .padding()

    }

}
