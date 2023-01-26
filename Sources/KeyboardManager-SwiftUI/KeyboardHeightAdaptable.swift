//
//  KeyboardHeightAdaptable.swift
//  KeyboardManager-SwiftUI
//
//  Created by Hitendra Solanki on 26/01/2023.
//  Twitter: @hitendrahckr - Medium: @hitendrahckr
//  Copyright © 2023 by Hitendra Solanki. All rights reserved.
//

import SwiftUI
import Combine

/// Adjust bottom offset of view
/// - KeyboardHeightAdaptable modifier wraps your view in a `GeometryReader`,
/// - which attempts to fill all the available space, potentially increasing content view size.
struct KeyboardHeightAdaptable: ViewModifier {
	
	/// bottom padding of the main content
	/// this will be updated as per keyboard height
    @State private var bottomPadding: CGFloat = 0

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.bottom, bottomPadding)
				.onReceive(KeyboardPublishers.heightPublisher) { keyboardHeight in
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    self.bottomPadding = max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
            }
            .animation(.easeOut(duration: 0.16)) //in iOS13 this will not show warning any more
        }
    }
}

public extension View {
    func keyboardHeightAdaptable() -> some View {
		modifier(KeyboardHeightAdaptable())
    }
}
