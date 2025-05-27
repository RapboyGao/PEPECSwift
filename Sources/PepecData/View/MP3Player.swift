
import AVFoundation
import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
struct AudioPlayerView: View {
    private let audioUrl: URL
    private var audioPlayer: AVAudioPlayer?

    @State private var isPlaying = false

    init(audioUrl: URL) {
        self.audioUrl = audioUrl
        // 初始化音频播放器
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl, fileTypeHint: String(kAudioFileMP3Type))
            audioPlayer?.prepareToPlay()
        } catch {
            print("音频初始化失败: \(error.localizedDescription)")
        }
    }

    var body: some View {
        HStack {
            Button {
                startPlaying()
            } label: {
                Image(systemName: isPlaying ? "stop.fill" : "play.fill")
            }
        }
    }

    private func startPlaying() {
        guard let player = audioPlayer, !isPlaying else { return }
        player.play()
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
#Preview {
    if let testUrl = Bundle.module.url(forResource: "087", withExtension: "mp3") {
        AudioPlayerView(audioUrl: testUrl)
    }
}
