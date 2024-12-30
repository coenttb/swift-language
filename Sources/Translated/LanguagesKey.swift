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
    public static let testValue: Set<Language> = .init(Language.allCases)
}

extension DependencyValues {
    public var languages: Set<Language> {
        get { self[LanguagesKey.self] }
        set { self[LanguagesKey.self] = newValue }
    }
}
