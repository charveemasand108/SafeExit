import Foundation
import Combine
import SwiftUI
final class TrustedContactsViewModel: ObservableObject {

    @Published var contacts: [TrustedContact] = []

    private let storageKey = "TrustedContacts"

    init() {
        loadContacts()
    }

    func addContact(name: String, phoneNumber: String) {
        let contact = TrustedContact(
            name: name,
            phoneNumber: phoneNumber
        )

        contacts.append(contact)
        saveContacts()
    }

    func delete(contact: TrustedContact) {
        contacts.removeAll { $0.id == contact.id }
        saveContacts()
    }

    func toggleFavorite(for contact: TrustedContact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else {
            return
        }

        contacts[index].isFavorite.toggle()
        saveContacts()
    }

    private func saveContacts() {
        do {
            let data = try JSONEncoder().encode(contacts)
            UserDefaults.standard.set(data, forKey: storageKey)
        } catch {
            print(error)
        }
    }

    private func loadContacts() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            return
        }

        do {
            contacts = try JSONDecoder().decode([TrustedContact].self, from: data)
        } catch {
            print(error)
        }
    }
}
