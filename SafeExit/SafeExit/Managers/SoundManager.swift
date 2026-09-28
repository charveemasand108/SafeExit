import Foundation
import AVFoundation

final class SoundManager {

    static let shared = SoundManager()

    private var player: AVAudioPlayer?

    private init() {}

    func playRingtone() {

        print("🎵 playRingtone() CALLED")

        guard let url = Bundle.main.url(
            forResource: "dragon-studio-phone-ringing-382734",
            withExtension: "mp3"
        ) else {
            print("❌ File not found")
            return
        }

        print("✅ File found:", url.lastPathComponent)

        do {

            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback, mode: .default)
            try session.setActive(true)

            player = try AVAudioPlayer(contentsOf: url)

            player?.numberOfLoops = -1
            player?.volume = 1.0
            player?.prepareToPlay()

            let success = player?.play() ?? false

            print("▶️ play() returned:", success)

        } catch {

            print("❌", error.localizedDescription)

        }

    }

    func stopRingtone() {

        player?.stop()
        player = nil

        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            print(error.localizedDescription)
        }

    }

}
