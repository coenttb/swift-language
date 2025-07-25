//
//  File.swift
//  swift-translating
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2025.
//

import Foundation
import Translated
import TranslatedString

public extension [TranslatedString] {
    func joined(separator: [String].Separator) -> TranslatedString {
        .init { language in
            self.map { $0(language) }.joined(separator: separator)(language)
        }
    }

    func joined(separator: String) -> TranslatedString {
        .init { language in
            self.map { $0(language) }.joined(separator: separator)
        }
    }
}
