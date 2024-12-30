//
//  File.swift
//  swift-language
//
//  Created by Coen ten Thije Boonkkamp on 30/12/2024.
//

import Foundation
import Dependencies
import Language

public enum LanguagesKey: TestDependencyKey {
    public static let testValue: Set<Language> = .allCases
    public static let allLanguages: Set<Language> = .init(Language.allCases)
}

extension Set<Language> {
    static let allCases: Self = .init(Language.allCases)
}

extension DependencyValues {
    public var languages: Set<Language> {
        get { self[LanguagesKey.self] }
        set { self[LanguagesKey.self] = newValue }
    }
}
