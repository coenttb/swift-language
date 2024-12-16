# swift-language

A Swift package providing cross-platform internationalization and localization support with type-safe language and translation handling.

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

This package is currently in active development and is subject to frequent changes. Features and APIs may change without prior notice until a stable release is available.

A Swift package providing robust internationalization and localization support with type-safe language handling, string translations, and date formatting.

## Features

- Support for 180+ languages with ISO 639-1/639-2 codes
- Type-safe language switching and fallbacks
- Easy string translations with support for multiple languages
- Localized date formatting
- Plural forms support
- Dependency injection support for language preferences
- Automatic locale mapping
- Clean, expressive API

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

// Get inline translation for current language
@Dependency(\.language) var language
let translatedGreeting = greeting(language)

// results in "Hallo"
```

## Feedback is Much Appreciated!
  
If you’re working on your own Swift web project, feel free to learn, fork, and contribute.

Got thoughts? Found something you love? Something you hate? Let me know! Your feedback helps make this project better for everyone. Open an issue or start a discussion—I’m all ears.

> [Subscribe to my newsletter](http://coenttb.com/en/newsletter/subscribe)
>
> [Follow me on X](http://x.com/coenttb)
> 
> [Link on Linkedin](https://www.linkedin.com/in/tenthijeboonkkamp)

## License

This project is licensed by coenttb under the **Apache 2.0 License**.  
See [LICENSE](LICENCE) for details.
