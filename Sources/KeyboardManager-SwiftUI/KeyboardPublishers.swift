//
//  KeyboardPublishers.swift
//  KeyboardManager-SwiftUI
//
//  Created by Hitendra Solanki on 26/01/2023.
//  Twitter: @hitendrahckr - Medium: @hitendrahckr
//  Copyright © 2023 by Hitendra Solanki. All rights reserved.
//

import Combine
import UIKit

/// KeyboardPublishers from notification center
public struct KeyboardPublishers {
	
	/// Keyboard will show publisher
	public static var willShowPublisher = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
		.map { KeyboardNotification(notification: $0).keyboardHeight }
	
	/// Keyboard will hide publisher
	public static var willHidePublisher = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
		.map { _ in CGFloat(0) }
	
	/// Keyboard height publisher
	/// combinatino of willShowPublisher and willHidePublisher
	public static var heightPublisher: AnyPublisher<CGFloat, Never> {
		Publishers.MergeMany(
			willShowPublisher,
			willHidePublisher
		).eraseToAnyPublisher()
	}
}


/// Keyboard notification to calculation keyboard related values
public struct KeyboardNotification {
	public private(set) var notification: Notification
	
	/// Keyboard height calculation helper
	public var keyboardHeight: CGFloat {
		guard let keyboardRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
			return 0
		}
		return keyboardRect.height
	}
}
