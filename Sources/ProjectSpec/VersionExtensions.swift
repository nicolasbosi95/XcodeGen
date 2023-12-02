//
//  File.swift
//
//
//  Created by Yonas Kolb on 7/2/20.
//

import Foundation
import Version

extension Version: ExpressibleByStringLiteral {

    public static func parse(_ string: String) throws -> Version {
        guard let version = Version(tolerant: string) else {
            throw SpecParsingError.invalidVersion(string)
        }

        return version
    }

    public static func parse(_ double: Double) throws -> Version {
        return try Version.parse(String(double))
    }

    public init(stringLiteral value: String) {
        self.init(tolerant: value)!
    }
}
