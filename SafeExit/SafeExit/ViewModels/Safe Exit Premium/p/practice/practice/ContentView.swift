//
//  ContentView.swift
//  practice
//
//  Created by Charvee Masand on 02/08/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: practiceDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(practiceDocument()))
}
