//
//  ProfileView.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 29.12.2024.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                    .padding()

                Spacer()

                Button(action: {
                    // Add logout functionality or other actions
                }) {
                    Text("Logout")
                        .font(.callout)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}
