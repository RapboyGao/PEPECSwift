import AVFoundation
import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
struct AudioPlayerView: View {
    private let audioUrl: URL
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying = false
    
    init(audioUrl: URL) {
        self.audioUrl = audioUrl
        // 初始化音频播放器
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            audioPlayer?.prepareToPlay()
        } catch {
            print("音频初始化失败: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        HStack {
            Button(action: {
                if isPlaying {
                    stopPlaying()
                } else {
                    startPlaying()
                }
            }) {
                Image(systemName: isPlaying ? "stop.fill" : "play.fill")
//                    .font(.title)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(isPlaying ? .red : .blue)
//                    .clipShape(Circle())
            }
        }
    }
    
    private func startPlaying() {
        guard let player = audioPlayer, !isPlaying else { return }
        player.play()
        isPlaying = true
    }
    
    private func stopPlaying() {
        guard let player = audioPlayer, isPlaying else { return }
        player.stop()
        player.currentTime = 0 // 停止后回到开头
        isPlaying = false
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        // 替换为真实的MP3文件URL（示例URL为测试用）
//        let testUrl = Bundle.module.url(forResource: "001", withExtension: "mp3")
        let testUrl = URL(string: "https://aviation-docs2.netlify.app/music/mp3/001.mp3")
        if let testUrl = testUrl {
            AudioPlayerView(audioUrl: testUrl)
        }
    }
}
    
