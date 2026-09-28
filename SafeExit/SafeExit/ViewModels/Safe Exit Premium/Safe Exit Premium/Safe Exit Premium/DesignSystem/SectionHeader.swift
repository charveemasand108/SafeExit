//
//  SectionHeader.swift
//  Safe Exit Premium
//
//  Created by Charvee Masand on 29/07/26.
//
import SwiftUI
struct SectionHeader : View {
  let title: String
  var body: some View{
    HStack {
      Text(title)
        .font(AppFont.headLine)
      Spacer()
    }
  }
}
