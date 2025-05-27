import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
public struct PEPECSentencesView: View {
    var sentences: [PEPECSentence]

    public var body: some View {
        ForEach(sentences) { sentence in
            PEPECSentenceView(sentence: sentence)
        }
    }

    public init(_ sentences: [PEPECSentence]) {
        self.sentences = sentences
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
#Preview {
    List {
        PEPECSentencesView(PEPECSentence.hardestSequence)
    }
}
