//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 13/12/2020.
//

import Foundation


@dynamicMemberLookup
public struct SinglePlural<A> {
    public let single:A
    public let plural:A
    
    public var enkelvoud:A { single }
    public var meervoud:A { plural }

    public subscript<T>(dynamicMember keyPath: KeyPath<A, T>) -> T { single[keyPath: keyPath] }
    
    public enum Variant {
        case single
        case plural
    }
    
    public func callAsFunction(with variant:Variant = .single)->A {
        callAsFunction(variant: variant)
    }
    
    public func callAsFunction(in variant:Variant = .single)->A {
        callAsFunction(variant: variant)
    }
    
    public func callAsFunction(for variant:Variant = .single)->A {
        callAsFunction(variant: variant)
    }
    public func callAsFunction(_ variant:Variant = .single)->A {
        callAsFunction(variant:variant)
    }
    
    
    
    public func callAsFunction(_ int:Int)->A {
        if int == 1 {
            return self.single
        } else {
            return self.plural
        }
        
//        callAsFunction(variant:variant)
    }
    
    public func callAsFunction(variant:Variant = .single)->A {
        switch variant {
        case .single: return self.single
        case .plural: return self.plural
        }
    }
    
    
    
    public func map<B>(_ transform:(A)->B)->SinglePlural<B> {
        return SinglePlural<B>.init(single: transform(self.single), plural: transform(self.plural))
    }
    
    public func flatMap<B>(_ transform:(A)->SinglePlural<B>)->SinglePlural<B> {
        return SinglePlural<B>.init(single: transform(self.single).single, plural: transform(self.plural).plural)
    }
    
    public init(
        _ all: (Variant)->A
    ){
        self.single = all(.single)
        self.plural = all(.plural)
    }
    
    public init(
        
        single:A,
        plural:A
    ){
        self.single = single
        self.plural = plural
    }
}

public extension SinglePlural where A == Translated<String> {
    static let parties:Self = .init(single: .init(english: "Party", dutch: "Partij"), plural: .init(english: "Parties", dutch: "Partijen"))
}

extension SinglePlural:CustomStringConvertible where A == Translated<String> {
    
    public func callAsFunction(_ language:Languages.Language = .current)->String {
        self.single(language)
    }
    
    public init(
        _ string:Translated<String>
    ) {
        self.single = string
        self.plural = string
    }
    
    public init(
        english:String,
        dutch:String
    ) {
        self.single = .init(english: english, dutch: dutch)
        self.plural = .init(english: english, dutch: dutch)
    }
    
    public var description: String {
        self.single.callAsFunction(language: .current)
    }
}

extension SinglePlural: ExpressibleByUnicodeScalarLiteral where A == Translated<String> {
    public init(unicodeScalarLiteral value: Translated<String>) {
        self.single = value
        self.plural = value
    }
    
    public typealias UnicodeScalarLiteralType = String
    
}

extension SinglePlural: ExpressibleByExtendedGraphemeClusterLiteral where A == Translated<String> {
    public typealias ExtendedGraphemeClusterLiteralType = String
    
}

extension SinglePlural:ExpressibleByStringLiteral where A == Translated<String> {
    public init(stringLiteral:String) {
        self.single = .init(stringLiteral)
        self.plural = .init(stringLiteral)
    }
}

public extension SinglePlural where A == Translated<String> {
    static let empty:Self = .init(single: "", plural: "")
}

extension SinglePlural:Equatable where A:Equatable {}
extension SinglePlural:Hashable where A:Hashable {}

public struct Translated<A> {
    
    public var english:A
    public var dutch:A
    public var french:A
    public var italian:A
    public var spanish:A
    public var german:A
    
    public var engels:A { english }
    public var nederlands:A { dutch }
    public var nl:A { dutch }
    
    
    public func callAsFunction(with language:Languages.Language = .current)->A {
        callAsFunction(language: language)
    }
    
    public func callAsFunction(in language:Languages.Language = .current)->A {
        callAsFunction(language: language)
    }
    
    public func callAsFunction(for language:Languages.Language = .current)->A {
        callAsFunction(language: language)
    }
    
    public func test()->A{
        fatalError()
    }
    
    public func callAsFunction(language:Languages.Language = .current)->A {
        switch language {
        case .dutch: return dutch
        case .english: return english
        case .french: return french
        case .german: return german
        case .italian: return italian
        case .spanish: return spanish
        }
    }
    
    public func callAsFunction(_ language:Languages.Language = .current)->A {
        callAsFunction(language: language)
    }
    
    public init(
        _ all:A
    ){
        self.dutch = all
        self.english = all
        self.german = all
        self.italian = all
        self.spanish = all
        self.french = all
    }
    
    public init(
        _ all:(Languages.Language)->A
    ){
        self.dutch = all(.dutch)
        self.english = all(.english)
        self.german = all(.german)
        self.italian = all(.italian)
        self.spanish = all(.spanish)
        self.french = all(.french)
    }
    
    public init(
        english:A,
        dutch:A
    ){
        self.dutch = dutch
        self.english = english
        self.german = english
        self.italian = english
        self.spanish = english
        self.french = english
    }
    
    public func map<B>(_ transform:(A)->B)->Translated<B> {
        return Translated<B>.init(english: transform(english), dutch: transform(self.dutch))
    }
    
    public func flatMap<B>(_ transform:(A)->Translated<B>)->Translated<B> {
        return .init(english: transform(english).english, dutch: transform(dutch).dutch)
    }
}

public extension Translated {
    init(
        english:A,
        dutch:A? = nil,
        german:A? = nil,
        italian:A? = nil,
        spanish:A? = nil,
        french:A? = nil
    ) {
        self.dutch = dutch ?? english
        self.english = english
        self.german = german ?? english
        self.italian = italian ?? english
        self.spanish = spanish ?? english
        self.french = french ?? english
    }
}


//extension Translated:StringProtocol where A:StringProtocol {}

extension Translated:Codable where A:Codable {
    
}

extension Translated:Equatable where A:Equatable {}

extension Translated:Hashable where A:Hashable {}

extension Translated:Comparable where A:Comparable {
    public static func < (lhs: Translated<A>, rhs: Translated<A>) -> Bool {
        lhs.dutch < rhs.dutch
    }
}

extension Translated where A == String {
    static func +(lhs: Self, rhs: String) -> Self {
        return Translated<String>.init(english: lhs(.english) + rhs, dutch: lhs(.dutch) + rhs)
    }
    
    static func +(lhs: String, rhs: Self) -> Self {
        return Translated<String>.init(english: lhs + rhs(.english), dutch: lhs + rhs(.dutch))
    }
}


public extension String {
    var any:Self {
        if let first = self.first {
            if Set<String>.consonents.contains(String(first)) {return "an \(self)"}
            else { return "a \(self)" }
        }
        return self
    }
}

public extension Translated where A == String {
    var any:Self {
        .init(
            
            english: {
                if let first = english.first {
                    if Set<String>.consonents.contains(String(first)) {return "an \(english)"}
                    else { return "a \(english)" }
                }
                return english
            }(),
            dutch: "een \(dutch)"
        )
    }
    
    var the:Self {
        .init(
            
            english: "the \(english)",
            dutch: "de \(dutch)"
        )
    }
}

extension Set where Element == String {
    static let consonents:Self = [
        "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"
    ]
}


public func +(_ lhs:Translated<String>, _ rhs:Translated<String>)->Translated<String> {
    return Translated<String>.init(english: lhs(in: .english) + rhs(in: .english), dutch: lhs(in: .dutch) + rhs(in: .dutch))
}

extension Translated:CustomStringConvertible where A == String {
    public var description: String {
        self.callAsFunction(language: .current)
    }
}

extension Translated: ExpressibleByUnicodeScalarLiteral where A == String {
    public init(unicodeScalarLiteral value: String) {
        self.dutch = value
        self.english = value
        self.dutch = value
        self.english = value
        self.german = value
        self.italian = value
        self.spanish = value
        self.french = value
    }
    
    public typealias UnicodeScalarLiteralType = String
    
}

extension Translated: ExpressibleByExtendedGraphemeClusterLiteral where A == String {
    public typealias ExtendedGraphemeClusterLiteralType = String
    
}

extension Translated:ExpressibleByStringLiteral where A == String {
    public init(stringLiteral:String) {
        self.dutch = stringLiteral
        self.english = stringLiteral
        self.dutch = stringLiteral
        self.english = stringLiteral
        self.german = stringLiteral
        self.italian = stringLiteral
        self.spanish = stringLiteral
        self.french = stringLiteral
    }
}

public extension Translated where A == String {
    static let empty:Self = .init(english: "", dutch: "")
}

public extension Translated where A == String {
    var capitalized:Self {
        .init(english: self.english.capitalized, dutch: self.dutch.capitalized)
    }
    
    func capitalized(with locale: Locale? = nil)->Self {
        .init(english: self.english.capitalized(with: locale), dutch: self.dutch.capitalized(with: locale))
    }
    
    func capitalizedFirstLetter()->Self {
        .init(english: self.english.prefix(1).capitalized + self.english.dropFirst(), dutch: self.dutch.prefix(1).capitalized + self.dutch.dropFirst())
    }
    
    
}
