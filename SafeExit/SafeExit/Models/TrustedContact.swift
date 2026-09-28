import Foundation

struct TrustedContact: Identifiable, Codable {

    let id: UUID
    var name: String
    var phoneNumber: String
    var isFavorite: Bool

    init(
        id: UUID = UUID(),
        name: String,
        phoneNumber: String,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.isFavorite = isFavorite
    }
}
