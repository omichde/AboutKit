//
//  OtherAppRowView.swift
//  AboutKit
//
//  Created by Adam Foot on 23/02/2021.
//

#if os(iOS) || os(visionOS)
import SwiftUI

struct OtherAppRowView: View {
    private let otherApp: AKOtherApp

    init(_ otherApp: AKOtherApp) {
        self.otherApp = otherApp
    }

    var body: some View {
        Link(destination: otherApp.appStoreURL) {
            HStack(spacing: 16) {
                AppIconImageView(for: otherApp, at: .init(width: 60, height: 60))

                Text(otherApp.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .lineLimit(2)

                Spacer(minLength: 1)

                Image(systemName: "arrow.up.right")
                    .font(.headline)
                    .foregroundStyle(.tint)
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(String(localized: "View \(otherApp.name) in the App Store", bundle: .module))
    }
}

#Preview {
    OtherAppRowView(AKOtherApp.example)
}
#endif
