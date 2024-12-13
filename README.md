# swift-language

A Swift package providing cross-platform internationalization and localization support with type-safe language and translation handling.

⚠️ **PACKAGE IN DEVELOPMENT** ⚠️  
This package is currently under active development and is not ready for production use. APIs may change significantly between versions without notice.

A Swift package providing robust internationalization and localization support with type-safe language handling, string translations, and date formatting.

## Development Status

- 🚧 Active development
- ⚠️ Breaking changes expected
- 📝 Documentation in progress
- 🧪 Testing incomplete
- 🔄 API subject to change

## Features

- 🌍 Support for 180+ languages with ISO 639-1/639-2 codes
- 🔄 Type-safe language switching and fallbacks
- 📝 Easy string translations with support for multiple languages
- 📅 Localized date formatting
- 🔡 Plural forms support
- 🎯 Dependency injection support for language preferences
- 🔄 Automatic locale mapping
- ✨ Clean, expressive API

## Installation

Add this package to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-language.git", branch: "main")
]
```

## Usage

### Basic Translation

```swift
import Language
import Translated

let greeting = TranslatedString(
    dutch: "Hallo",
    english: "Hello",
    french: "Bonjour",
    german: "Hallo",
    spanish: "Hola"
)

// Get translation for current language
@Dependency(\.language) var language
let translatedGreeting = greeting(language)

withDependencies {
    $0.language = .english
} {
    """
    \(greeting)
    """
}

// results in "Hello"

withDependencies {
    $0.language = .dutch
} {
    """
    \(greeting)
    """
}

// results in "Hallo"
```

### Date Formatting

```swift
import Date_Formatted_Localized

let date = Date()
let formattedDate = date.formatted(date: .long, time: .none)
    .localized // Will format according to current locale
```

## Requirements

- iOS 16.0+ / macOS 13.0+
- Swift 5.10+
- Xcode 15.0+

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Credits

Developed and maintained by [coenttb]. Feel free to reach out with any questions or feedback!
