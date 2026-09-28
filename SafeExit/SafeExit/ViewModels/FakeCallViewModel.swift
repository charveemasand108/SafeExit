import Foundation
import Combine

final class FakeCallViewModel: ObservableObject {

    @Published var callerName = "Mom"
    @Published var selectedDelay = 5
    @Published var showIncomingCall = false

    let delays = [5, 10, 15, 30]

    func startCall() {

        DispatchQueue.main.asyncAfter(deadline: .now() + Double(selectedDelay)) {
            self.showIncomingCall = true
        }

    }

}

