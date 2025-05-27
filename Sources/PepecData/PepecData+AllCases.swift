import Foundation

public extension PEPECSentence {
    static let allCases = allSentences
}

public extension PEPECSentence {
    static let hardestSequence: [PEPECSentence] = {
        var example = allSentences.sorted {
            $0.size > $1.size
        }
        for index in example.indices {
            example[index].index = index
        }
        return example
    }()
}

public extension [PEPECSentence] {
    static let all = allSentences
    static let hardestSequence = PEPECSentence.hardestSequence
}
