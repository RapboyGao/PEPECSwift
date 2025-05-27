import SwiftUI

public struct PEPECSentence: Codable, Sendable, Identifiable {
    public let id: Int
    public let content: String
    public let specialReading: String? // 可选字段（部分条目无此属性）
    public let size: Int
    public let hasLotOfInfo: Bool? // 可选字段（部分条目无此属性）
    public var index: Int

    public var shownName: String {
        switch id {
        case 0 ... 9:
            return "00" + id.description
        case 10 ... 99:
            return "0" + id.description
        default:
            return id.description
        }
    }

    public var url: URL? {
        Bundle.module.url(forResource: shownName, withExtension: "mp3")
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public var header: Text {
        if id == index {
            return Text(id, format: .number.precision(.integerLength(3)))
        } else {
            return Text(index, format: .number.precision(.integerLength(3))) + Text("/900 (") + Text(id, format: .number.precision(.integerLength(3))) + Text(")")
        }
    }

    public init(id: Int, content: String, specialReading: String?, size: Int, hasLotOfInfo: Bool?) {
        self.id = id
        self.content = content
        self.specialReading = specialReading
        self.size = size
        self.hasLotOfInfo = hasLotOfInfo
        self.index = id
    }
}
