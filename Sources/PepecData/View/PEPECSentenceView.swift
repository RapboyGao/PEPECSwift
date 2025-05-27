import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
public struct PEPECSentenceView: View {
    @State private var isShown = false
    var sentence: PEPECSentence

    public var body: some View {
        Section {
            HStack {
                Text(sentence.id, format: .number)
                    + Text(". ")
                    +
                    Text(sentence.content)
                    .foregroundColor(isShown ? .primary : .clear)
            }
            .onTapGesture {
                isShown.toggle()
            }
            HStack {
                Spacer()
                if let url = sentence.url {
                    MP3Player(audioUrl: url)
                }
                Spacer()
            }

        } header: {
            sentence.header
        }
        .textSelection(.enabled)
    }

    public init(sentence: PEPECSentence) {
        self.sentence = sentence
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
#Preview {
    List {
        PEPECSentenceView(sentence: .allCases[0])
    }
}
