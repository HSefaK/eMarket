//
//  SearchBar.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}
