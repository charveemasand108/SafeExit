//
//  practiceApp.swift
//  practice
//
//  Created by Charvee Masand on 02/08/26.
//

import SwiftUI

@main
struct practiceApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: practiceDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
