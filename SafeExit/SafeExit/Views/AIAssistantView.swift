import SwiftUI

struct AIAssistantView: View {

    @State private var question = ""

    var body: some View {

        ZStack {

            AnimatedBackground()

            VStack(spacing:25){

                Text("AI Safety Assistant")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                TextField(
                    "Ask anything...",
                    text:$question
                )
                .textFieldStyle(.roundedBorder)

                GlassCard{

                    VStack(alignment:.leading,spacing:12){

                        Text("Suggestion")
                            .font(.headline)
                            .foregroundStyle(.white)

                        Text(response)
                            .foregroundStyle(.white)

                    }

                }

                Spacer()

            }
            .padding()

        }

    }

    var response:String{

        switch question.lowercased(){

        case let q where q.contains("alone"):
            return "Share your live location and enable Travel Mode."

        case let q where q.contains("night"):
            return "Avoid isolated routes and inform a trusted contact."

        case let q where q.contains("cab"):
            return "Verify the cab number and share trip details."

        case let q where q.contains("follow"):
            return "Move toward a crowded place and prepare to activate SOS."

        default:
            return "I'm here to help with safety suggestions."

        }

    }

}

#Preview{

    AIAssistantView()

}
