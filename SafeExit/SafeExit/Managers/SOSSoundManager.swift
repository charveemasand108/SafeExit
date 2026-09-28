import Foundation
import AVFoundation

final class SOSSoundManager {

    static let shared = SOSSoundManager()

    private var player: AVAudioPlayer?

    private init() {}

    func playSiren() {

        guard let url = Bundle.main.url(
            forResource: "emergency_siren",   // emergency_siren.mp3
            withExtension: "mp3"
        ) else {
            print("❌ Siren file not found")
            return
        }

        do {

            let session = AVAudioSession.sharedInstance()

            try session.setCategory(.playback, mode: .default)
            try session.setActive(true)

            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.volume = 1.0
            player?.prepareToPlay()
            player?.play()

            print("🚨 Siren Started")

        } catch {

            print(error.localizedDescription)

        }
    }

    func stopSiren() {

        player?.stop()
        player = nil

        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            print(error.localizedDescription)
        }
    }
}
