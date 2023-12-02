import Foundation
import JSONUtilities

/// Specifies the use of a plug-in product in a target.
public struct BuildToolPlugin: Equatable {

    /// The name of the plug-in target.
    public var plugin: String
    /// The name of the package that defines the plug-in target.
    public var package: String
    
    public init(
        plugin: String,
        package: String
    ) {
        self.plugin = plugin
        self.package = package
    }
}

extension BuildToolPlugin: JSONObjectConvertible {

    public init(jsonDictionary: JSONDictionary) throws {
        guard let plugin: String = jsonDictionary.json(atKeyPath: "plugin"),
              let package: String = jsonDictionary.json(atKeyPath: "package") else {
            throw SpecParsingError.invalidDependency(jsonDictionary)
        }
        
        self.plugin = plugin
        self.package = package
    }
}

extension BuildToolPlugin {
    public var uniqueID: String {
        return "\(plugin)/\(package)"
    }
}

extension BuildToolPlugin: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(plugin)
        hasher.combine(package)
    }
}

extension BuildToolPlugin: JSONEncodable {
    public func toJSONValue() -> Any {
        [
            "plugin": plugin,
            "package": package
        ]
    }
}
