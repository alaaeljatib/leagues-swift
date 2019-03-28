import Foundation

/// Describes the sports API
struct SportsAPI {
    
    static let instance = SportsAPI()
    
    /// Gets the list of soccer leagues
    ///
    /// - returns: an array of League objects (soccer only)
    func leagues() -> [League] {
        // as everything is bundled in the app, error handling omitted
        let url = Bundle.main.url(forResource: "Data", withExtension: "plist")!
        let data = try! Data(contentsOf: url)

        let decoder = PropertyListDecoder()
        return try! decoder.decode([League].self, from: data)
    }
}


/// Describes a sports league
struct League: Codable {
    /// the name of the league
    let name: String

    /// the list of teams in the league
    let teams: [Team]
}


/// Describes a sports team
///
/// Custom implementation of Codable because our mock data uses Strings to represent URLs,
/// but the default Codable implementation for URL uses a dictionary
struct Team: Codable {
	/// the name of the team
	let name: String

	/// the URL of the team's logo
	let logo: URL?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)

        let logoString = try container.decodeIfPresent(String.self, forKey: .logo)
        logo = logoString.flatMap(URL.init)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(logo?.absoluteString, forKey: .logo)
    }

    private enum CodingKeys: CodingKey {
        case name
        case logo
    }
}
