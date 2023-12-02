import Foundation

struct StringCatalog: Decodable, CustomStringConvertible {
    let sourceLanguage: String
    let version: String
    
    var description: String {
        "{sourceLanguage: \(sourceLanguage), version: \(version)}"
    }
}
