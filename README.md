# KeyboardManager-SwiftUI

**Keyboard Manager for SwiftUI Views**
KeyboardManager-SwiftUI is the tiny SwiftUI library for automatically handling bottom offset of any view when keyboard is visible on screen.

KeyboardManager-SwiftUI uses Combine publishers to get dynamic keyboard height

## KeyboardHeightAdaptable
> is SwiftUI ViewModifier

## keyboardHeightAdaptable()
> Public API can be used with  SwiftUI view

```swift
struct LoginView {
	@State private var username: String = ""
	@State private var password: String = ""
		
	var body: some View {
		VStack {
			TextField("Username", text: $username)
			TextField("Password", text: $password)
			textfield2
			textfield3
			textfield4
			textfield5
		}
		.keyboardHeightAdaptable()
	} 
}
```

## Requirements

| Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 13.0+ | 5.0 | [Swift Package Manager](#swift-package-manager), [Manual](#manually) | Fully Tested |

### Swift Package Manager

The  [Swift Package Manager](https://swift.org/package-manager/)  is a tool for automating the distribution of Swift code and is integrated into the  `swift`  compiler.

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the  `dependencies`  value of your  `Package.swift`.

```
dependencies: [
    .package(url: "https://github.com/hitendradeveloper/KeyboardManager-SwiftUI.git", .upToNextMajor(from: "1.0.0"))
]
```

## License

KeyboardManager-SwiftUI is released under the MIT license.
