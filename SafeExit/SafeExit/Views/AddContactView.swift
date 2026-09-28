import SwiftUI

struct AddContactView: View {

    @Environment(\.dismiss) private var dismiss

    @ObservedObject var viewModel: TrustedContactsViewModel

    @State private var name = ""
    @State private var phoneNumber = ""

    var body: some View {

        NavigationStack {

            Form {

                Section(header: Text("Contact Details")) {

                    TextField("Full Name", text: $name)

                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)

                }

            }
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {

                ToolbarItem(placement: .cancellationAction) {

                    Button("Cancel") {
                        dismiss()
                    }

                }

                ToolbarItem(placement: .confirmationAction) {

                    Button("Save") {

                        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                              !phoneNumber.trimmingCharacters(in: .whitespaces).isEmpty
                        else {
                            return
                        }

                        viewModel.addContact(
                            name: name,
                            phoneNumber: phoneNumber
                        )

                        dismiss()

                    }
                    .fontWeight(.semibold)

                }

            }

        }

    }

}

#Preview {
    AddContactView(
        viewModel: TrustedContactsViewModel()
    )
}
