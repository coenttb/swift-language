//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 17-12-2023.
//

import Dependencies
import Foundation
import Language
import Translated
import TranslatedString

extension DependencyValues {
    /// The current language to use for localization and translation.
    ///
    /// This dependency determines which language is used when:
    /// - Displaying `TranslatedString` instances via `description`
    /// - Comparing `Translated` instances
    /// - Resolving language-specific behavior
    ///
    /// ## Usage
    ///
    /// ```swift
    /// @Dependency(\.language) var language
    /// let translatedText = someTranslatedString.description // Uses current language
    ///
    /// // Override language for specific operations
    /// withDependencies {
    ///     $0.language = .dutch
    /// } operation: {
    ///     print(someTranslatedString) // Displays Dutch translation
    /// }
    /// ```
    ///
    /// - Note: Automatically derived from the current locale dependency
    public var language: Language {
        get { self[Language.self] }
        set { self[Language.self] = newValue }
    }
}

/// Conformance to DependencyKey allows Language to be used as a dependency.
///
/// The language is automatically derived from the current locale in all contexts,
/// ensuring consistency between locale-aware APIs and language-specific translations.
extension Language: DependencyKey {
    /// Live value derives language from the current locale
    public static var liveValue: Self {
        @Dependency(\.locale) var locale
        return .init(locale: locale)
    }

    /// Test value derives language from the test locale
    public static var testValue: Self {
        @Dependency(\.locale) var locale
        return .init(locale: locale)
    }

    /// Preview value derives language from the preview locale
    public static var previewValue: Self {
        @Dependency(\.locale) var locale
        return .init(locale: locale)
    }
}

/// String representation support for Translated<String> types using current language dependency.
extension Translated: CustomStringConvertible where A == String {
    /// Returns the translation for the current language dependency.
    ///
    /// This allows `TranslatedString` instances to be used directly in string contexts,
    /// automatically selecting the appropriate translation based on the current language.
    ///
    /// ```swift
    /// let greeting = TranslatedString(english: "Hello", dutch: "Hallo")
    /// 
    /// withDependencies { $0.language = .dutch } operation: {
    ///     print("\(greeting)!")  // Prints "Hallo!"
    /// }
    /// ```
    public var description: String {
        @Dependency(\.language) var language
        return self[language]
    }
}

/// Comparison support for Translated types using current language dependency.
extension Translated: Comparable where A: Comparable {
    /// Compares two Translated instances using the current language dependency.
    ///
    /// The comparison uses the translations for the current language, allowing
    /// for language-aware sorting and ordering of translated content.
    ///
    /// ```swift
    /// let items = [
    ///     TranslatedString(english: "Apple", dutch: "Appel"),
    ///     TranslatedString(english: "Banana", dutch: "Banaan")
    /// ]
    /// 
    /// withDependencies { $0.language = .dutch } operation: {
    ///     let sorted = items.sorted() // Sorts using Dutch translations
    /// }
    /// ```
    public static func < (lhs: Translated<A>, rhs: Translated<A>) -> Bool {
        @Dependency(\.language) var language
        return lhs[language] < rhs[language]
    }
}
