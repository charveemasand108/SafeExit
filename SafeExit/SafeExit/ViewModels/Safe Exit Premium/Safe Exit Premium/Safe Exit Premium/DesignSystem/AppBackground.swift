//
//  AppBackground.swift
//  Safe Exit Premium
//
//  Created by Charvee Masand on 29/07/26.
//

import SwiftUI

struct AppBackground<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        ZStack {
            AppColors.background
                .ignoresSafeArea()

            content
        }
    }
}
