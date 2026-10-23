//
//  MacOtherAppRow.swift
//  AboutKit
//
//  Created by Adam Foot on 14/03/2023.
//

#if os(macOS)
import SwiftUI

struct OtherAppRowView: View {
    private let otherApp: AKOtherApp

    init(_ otherApp: AKOtherApp) {
        self.otherApp = otherApp
    }

    var body: some View {
        Link(destination: otherApp.appStoreURL) {
            HStack(spacing: 12) {
                AppIconImageView(for: otherApp, at: .init(width: 32, height: 32))

                Text(otherApp.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(2)

                Spacer(minLength: 1)

                Image(systemName: "arrow.up.right")
                    .font(.headline)
                    .foregroundStyle(.tint)
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(String(localized: "View \(otherApp.name) in the App Store", bundle: .module))
    }
}

#Preview {
    Form {
        OtherAppRowView(AKOtherApp.example)
    }
    .formStyle(.grouped)
}
#endif
