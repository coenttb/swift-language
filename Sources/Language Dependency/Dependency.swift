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
    public var language: Language {
        get { self[Language.self] }
        set { self[Language.self] = newValue }
    }
}

extension Language: DependencyKey {
    public static let liveValue: Self = .english
    public static let testValue: Self = .english
    public static let previewValue: Self = .english
}

extension Translated: CustomStringConvertible where A == String {
    public var description: String {
        @Dependency(\.language) var language
        return self.callAsFunction(language: language)
    }
}

extension Translated: Comparable where A: Comparable {
    public static func < (lhs: Translated<A>, rhs: Translated<A>) -> Bool {

        @Dependency(\.language) var language

        return lhs(language) < rhs(language)
    }
}

extension Translated<String> {
    public func slug(language: Language = {
        @Dependency(\.language) var language
        return language
    }()) -> String {
//        self(language).slug()
        self.english.slug()
    }
}
