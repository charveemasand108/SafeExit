//
//  AppleCard.swift
//  Safe Exit Premium
//
//  Created by Charvee Masand on 29/07/26.
//

import SwiftUI

struct AppleCard<Content: View>: View {

    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            content
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}
