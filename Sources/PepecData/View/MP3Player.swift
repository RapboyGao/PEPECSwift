
import AVFoundation
import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
private class GlobalAudioPlayer: ObservableObject {
    private var currentAudioPlayer: AVAudioPlayer?

    func play(url: URL?) {
        guard let url = url else {
            return
        }
        do {
            currentAudioPlayer?.stop()
            currentAudioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: String(kAudioFileMP3Type))
            currentAudioPlayer?.prepareToPlay()
            currentAudioPlayer?.play()

        } catch {
            print("音频初始化失败: \(error.localizedDescription)")
        }
    }

    init() {
        currentAudioPlayer = nil
    }

    @MainActor static let global = GlobalAudioPlayer()
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
struct MP3Player: View {
    private let audioUrl: URL

    @StateObject private var state = GlobalAudioPlayer.global

    init(audioUrl: URL) {
        self.audioUrl = audioUrl
        // 初始化音频播放器
    }

    var body: some View {
        HStack {
            Button {
                startPlaying()
            } label: {
                Image(systemName: "play.fill")
//                Image(systemName: isPlaying ? "stop.fill" : "play.fill")
            }
        }
    }

    private func startPlaying() {
        state.play(url: audioUrl)
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
#Preview {
    if let testUrl = Bundle.module.url(forResource: "087", withExtension: "mp3") {
        MP3Player(audioUrl: testUrl)
    }
}
