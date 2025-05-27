import Foundation

public struct PEPECSentence: Codable, Sendable, Identifiable {
    public let id: Int
    public let content: String
    public let specialReading: String? // 可选字段（部分条目无此属性）
    public let size: Int
    public let hasLotOfInfo: Bool? // 可选字段（部分条目无此属性）

    public init(id: Int, content: String, specialReading: String?, size: Int, hasLotOfInfo: Bool?) {
        self.id = id
        self.content = content
        self.specialReading = specialReading
        self.size = size
        self.hasLotOfInfo = hasLotOfInfo
    }
}
