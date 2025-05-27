import Foundation

public extension PEPECSentence {
    static let allCases = allSentences
}

public extension PEPECSentence {
    static let hardestSequence: [PEPECSentence] = allSentences.sorted {
        $0.size > $1.size
    }
}
